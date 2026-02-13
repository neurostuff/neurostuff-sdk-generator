#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <sdk-output-dir> <package-name>" >&2
    exit 1
fi

sdk_dir="$1"
package_name="$2"
package_dir="${sdk_dir}/${package_name}"

if [ ! -d "${package_dir}" ]; then
    echo "Package directory does not exist: ${package_dir}" >&2
    exit 1
fi

cat > "${package_dir}/auth.py" <<'PYCODE'
"""Auth helpers for __PACKAGE_NAME__."""

from __future__ import annotations

import json
import os
import threading
import time
import types
import urllib.error
import urllib.request
from dataclasses import dataclass, field
from typing import Any, Dict, Optional

from __PACKAGE_NAME__.configuration import Configuration


class Auth0TokenExchangeError(RuntimeError):
    """Raised when the refresh-token exchange with Auth0 fails."""


@dataclass
class Auth0RefreshTokenAuth:
    """Refreshes Auth0 access tokens and injects them into SDK Configuration."""

    domain: str
    client_id: str
    refresh_token: str
    audience: Optional[str] = None
    client_secret: Optional[str] = None
    scope: Optional[str] = None
    timeout_seconds: float = 15.0
    refresh_skew_seconds: int = 60
    _access_token: Optional[str] = field(default=None, init=False, repr=False)
    _expires_at: float = field(default=0.0, init=False, repr=False)
    _lock: threading.Lock = field(default_factory=threading.Lock, init=False, repr=False)

    @classmethod
    def from_env(cls, prefix: str = "AUTH0") -> "Auth0RefreshTokenAuth":
        required = {
            f"{prefix}_DOMAIN": os.getenv(f"{prefix}_DOMAIN"),
            f"{prefix}_CLIENT_ID": os.getenv(f"{prefix}_CLIENT_ID"),
            f"{prefix}_REFRESH_TOKEN": os.getenv(f"{prefix}_REFRESH_TOKEN"),
        }
        missing = [name for name, value in required.items() if not value]
        if missing:
            missing_vars = ", ".join(sorted(missing))
            raise ValueError(f"Missing required Auth0 environment variables: {missing_vars}")

        return cls(
            domain=required[f"{prefix}_DOMAIN"],
            client_id=required[f"{prefix}_CLIENT_ID"],
            refresh_token=required[f"{prefix}_REFRESH_TOKEN"],
            audience=os.getenv(f"{prefix}_AUDIENCE") or None,
            client_secret=os.getenv(f"{prefix}_CLIENT_SECRET") or None,
            scope=os.getenv(f"{prefix}_SCOPE") or None,
        )

    def token_endpoint(self) -> str:
        normalized = self.domain.strip().rstrip("/")
        if normalized.startswith("http://") or normalized.startswith("https://"):
            base = normalized
        else:
            base = f"https://{normalized}"

        if base.endswith("/oauth/token"):
            return base
        return f"{base}/oauth/token"

    def install(self, configuration: Configuration) -> None:
        """Inject automatic refresh logic into this configuration instance."""

        original_auth_settings = configuration.__class__.auth_settings

        def _auth_settings(config_self: Configuration) -> Dict[str, Any]:
            config_self.access_token = self.get_access_token()
            return original_auth_settings(config_self)

        configuration.auth_settings = types.MethodType(_auth_settings, configuration)
        configuration.access_token = self.get_access_token()

    def needs_refresh(self) -> bool:
        if not self._access_token:
            return True
        return time.time() >= (self._expires_at - self.refresh_skew_seconds)

    def get_access_token(self, force_refresh: bool = False) -> str:
        with self._lock:
            if force_refresh or self.needs_refresh():
                self._exchange_refresh_token()

            if not self._access_token:
                raise Auth0TokenExchangeError("Auth0 token exchange returned no access token.")
            return self._access_token

    def _exchange_refresh_token(self) -> None:
        payload: Dict[str, Any] = {
            "grant_type": "refresh_token",
            "client_id": self.client_id,
            "refresh_token": self.refresh_token,
        }
        if self.client_secret:
            payload["client_secret"] = self.client_secret
        if self.audience:
            payload["audience"] = self.audience
        if self.scope:
            payload["scope"] = self.scope

        request = urllib.request.Request(
            self.token_endpoint(),
            data=json.dumps(payload).encode("utf-8"),
            headers={"Content-Type": "application/json"},
            method="POST",
        )

        try:
            with urllib.request.urlopen(request, timeout=self.timeout_seconds) as response:
                raw_body = response.read().decode("utf-8")
                body = json.loads(raw_body)
        except urllib.error.HTTPError as exc:
            raw_error = exc.read().decode("utf-8", "replace")
            raise Auth0TokenExchangeError(
                f"Auth0 token exchange failed with HTTP {exc.code}: {raw_error}"
            ) from exc
        except (urllib.error.URLError, TimeoutError, ValueError) as exc:
            raise Auth0TokenExchangeError(f"Auth0 token exchange failed: {exc}") from exc

        access_token = body.get("access_token")
        if not access_token:
            raise Auth0TokenExchangeError(
                "Auth0 token exchange response does not contain `access_token`."
            )

        rotated_refresh_token = body.get("refresh_token")
        if rotated_refresh_token:
            self.refresh_token = rotated_refresh_token

        expires_in_raw = body.get("expires_in", 3600)
        try:
            expires_in = int(expires_in_raw)
        except (TypeError, ValueError):
            expires_in = 3600

        self._access_token = access_token
        self._expires_at = time.time() + max(expires_in, 0)


__all__ = ["Auth0RefreshTokenAuth", "Auth0TokenExchangeError"]
PYCODE

cat > "${package_dir}/sdk.py" <<'PYCODE'
"""Ergonomic SDK facade for __PACKAGE_NAME__."""

from __future__ import annotations

import importlib
import pkgutil
import re
from typing import Any, Dict, List, Optional, Tuple, Type

from __PACKAGE_NAME__.api_client import ApiClient
from __PACKAGE_NAME__.auth import Auth0RefreshTokenAuth
from __PACKAGE_NAME__.configuration import Configuration


ApiClass = Type[Any]
_API_DISCOVERY_CACHE: Optional[Tuple[Dict[str, ApiClass], List[str]]] = None


def _normalize_alias(name: str) -> str:
    return re.sub(r"[^a-z0-9]+", "", name.lower())


def _to_snake_case(name: str) -> str:
    first_pass = re.sub(r"(.)([A-Z][a-z]+)", r"\1_\2", name)
    return re.sub(r"([a-z0-9])([A-Z])", r"\1_\2", first_pass).lower()


def _discover_api_classes() -> Tuple[Dict[str, ApiClass], List[str]]:
    global _API_DISCOVERY_CACHE
    if _API_DISCOVERY_CACHE is not None:
        return _API_DISCOVERY_CACHE

    alias_to_class: Dict[str, ApiClass] = {}
    canonical_names: List[str] = []
    api_package = importlib.import_module("__PACKAGE_NAME__.api")

    for module_info in pkgutil.iter_modules(api_package.__path__):
        module_name = module_info.name
        if not module_name.endswith("_api"):
            continue

        module = importlib.import_module(f"__PACKAGE_NAME__.api.{module_name}")
        api_class: Optional[ApiClass] = None

        for attr_name in dir(module):
            attr_value = getattr(module, attr_name)
            if isinstance(attr_value, type) and attr_name.endswith("Api"):
                api_class = attr_value
                break

        if api_class is None:
            continue

        canonical_name = module_name[: -len("_api")]
        canonical_names.append(canonical_name)

        alias_candidates = {
            canonical_name,
            module_name,
            api_class.__name__,
            _to_snake_case(api_class.__name__),
            _to_snake_case(api_class.__name__.removesuffix("Api")),
        }

        for alias in alias_candidates:
            alias_to_class[_normalize_alias(alias)] = api_class

    canonical_names.sort()
    _API_DISCOVERY_CACHE = (alias_to_class, canonical_names)
    return _API_DISCOVERY_CACHE


class SDK:
    """One-stop facade for API groups with optional Auth0 token refresh."""

    def __init__(
        self,
        host: Optional[str] = None,
        access_token: Optional[str] = None,
        configuration: Optional[Configuration] = None,
        auth: Optional[Auth0RefreshTokenAuth] = None,
    ) -> None:
        if configuration is None:
            configuration = Configuration(host=host) if host else Configuration()
        elif host is not None:
            configuration.host = host

        if access_token:
            configuration.access_token = access_token

        if auth is not None:
            auth.install(configuration)

        self.configuration = configuration
        self.auth = auth
        self.api_client = ApiClient(self.configuration)
        self._instances: Dict[ApiClass, Any] = {}
        self._aliases, self._canonical_names = _discover_api_classes()

    @classmethod
    def from_auth0_refresh_token(
        cls,
        domain: str,
        client_id: str,
        refresh_token: str,
        host: Optional[str] = None,
        configuration: Optional[Configuration] = None,
        audience: Optional[str] = None,
        client_secret: Optional[str] = None,
        scope: Optional[str] = None,
    ) -> "SDK":
        auth = Auth0RefreshTokenAuth(
            domain=domain,
            client_id=client_id,
            refresh_token=refresh_token,
            audience=audience,
            client_secret=client_secret,
            scope=scope,
        )
        return cls(host=host, configuration=configuration, auth=auth)

    @classmethod
    def from_auth0_env(
        cls,
        host: Optional[str] = None,
        configuration: Optional[Configuration] = None,
        prefix: str = "AUTH0",
    ) -> "SDK":
        auth = Auth0RefreshTokenAuth.from_env(prefix=prefix)
        return cls(host=host, configuration=configuration, auth=auth)

    def available_apis(self) -> List[str]:
        return list(self._canonical_names)

    def api(self, name: str) -> Any:
        normalized = _normalize_alias(name)
        api_class = self._aliases.get(normalized)
        if api_class is None:
            available = ", ".join(self._canonical_names)
            raise KeyError(f"Unknown API group `{name}`. Available APIs: {available}")

        instance = self._instances.get(api_class)
        if instance is None:
            instance = api_class(self.api_client)
            self._instances[api_class] = instance
        return instance

    def __getattr__(self, name: str) -> Any:
        try:
            return self.api(name)
        except KeyError as exc:
            raise AttributeError(str(exc)) from exc

    def __enter__(self) -> "SDK":
        return self

    def __exit__(self, exc_type, exc_value, traceback) -> bool:
        api_client_exit = getattr(self.api_client, "__exit__", None)
        if callable(api_client_exit):
            return bool(api_client_exit(exc_type, exc_value, traceback))
        return False


__all__ = ["SDK"]
PYCODE

sed -i "s/__PACKAGE_NAME__/${package_name}/g" "${package_dir}/auth.py" "${package_dir}/sdk.py"

readme_path="${sdk_dir}/README.md"
if [ -f "${readme_path}" ]; then
    tmp_readme="$(mktemp)"
    awk '
        BEGIN {skip = 0}
        /^<!-- neurostuff-sdk-helpers:start -->$/ {skip = 1; next}
        /^<!-- neurostuff-sdk-helpers:end -->$/ {skip = 0; next}
        skip == 0 {print}
    ' "${readme_path}" > "${tmp_readme}"

    cat "${tmp_readme}" > "${readme_path}"
    rm -f "${tmp_readme}"

    cat >> "${readme_path}" <<'DOC'

<!-- neurostuff-sdk-helpers:start -->
## Neurostuff SDK Helpers

The generator adds two helper modules to reduce import friction:

1. `sdk.py`: a single facade for endpoint groups.
2. `auth.py`: Auth0 refresh-token exchange + automatic bearer token refresh.

### Minimal usage

```python
from PACKAGE_NAME.sdk import SDK

sdk = SDK(host="https://example.org/api", access_token="<access-token>")
studysets_api = sdk.studysets
result = studysets_api.studysets_get()
```

### Auth0 refresh-token usage

```python
from PACKAGE_NAME.sdk import SDK

sdk = SDK.from_auth0_refresh_token(
    domain="your-tenant.us.auth0.com",
    client_id="<auth0-client-id>",
    refresh_token="<auth0-refresh-token>",
    audience="<optional-audience>",
)

# Access token is exchanged and refreshed automatically per request.
users = sdk.users.users_get()
```

You can also use environment variables:
`AUTH0_DOMAIN`, `AUTH0_CLIENT_ID`, `AUTH0_REFRESH_TOKEN`, plus optional
`AUTH0_AUDIENCE`, `AUTH0_CLIENT_SECRET`, `AUTH0_SCOPE`.

```python
sdk = SDK.from_auth0_env(prefix="AUTH0")
```
<!-- neurostuff-sdk-helpers:end -->
DOC

    sed -i "s/PACKAGE_NAME/${package_name}/g" "${readme_path}"
fi
