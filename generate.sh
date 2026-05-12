#!/usr/bin/env bash

set -euo pipefail

generate="${1:-}"
version="${2:-}"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
generator_image="openapitools/openapi-generator-cli:v7.17.0"
python_helper_script="${script_dir}/scripts/inject_python_sdk_helpers.sh"

get_spec_version() {
    local spec_file="$1"
    grep -m1 "^  version:" "${spec_file}" | sed "s/^  version: //; s/['\"]//g; s/ *$//"
}

neurostore_version="${version:-$(get_spec_version "${script_dir}/neurostore-spec/neurostore-openapi.yml")}"
compose_version="${version:-$(get_spec_version "${script_dir}/neurostore-spec/neurosynth-compose-openapi.yml")}"

run_generator() {
    docker run --rm --user "$(id -u):$(id -g)" \
        -v "${script_dir}:/local" "${generator_image}" generate "$@"
}

clean_python_sdk() {
    local sdk_dir="$1"
    local package_name="$2"
    rm -rf "${sdk_dir}/${package_name}/models" "${sdk_dir}/${package_name}/api" "${sdk_dir}/test"
}

inject_python_helpers() {
    local sdk_dir="$1"
    local package_name="$2"

    "${python_helper_script}" "${sdk_dir}" "${package_name}"
}

if [ -z "${generate}" ] || [ "${generate}" == "python-neurostore" ] || [ "${generate}" == "neurostore-python-sdk" ]; then
    echo "generating python-neurostore-sdk (v${neurostore_version})..."
    clean_python_sdk "${script_dir}/python/neurostore-python-sdk" "neurostore_sdk"
    run_generator \
        -i /local/neurostore-spec/neurostore-openapi.yml \
        -g python \
        -c /local/neurostore_python_nextgen_sdk_config.json \
        -o /local/python/neurostore-python-sdk \
        -t /local/templates/python \
        --additional-properties packageVersion="${neurostore_version}" \
        --openapi-normalizer REMOVE_X_INTERNAL=true,KEEP_ONLY_FIRST_TAG_IN_OPERATION=true
    inject_python_helpers "${script_dir}/python/neurostore-python-sdk" "neurostore_sdk"
fi

if [ -z "${generate}" ] || [ "${generate}" == "typescript-neurostore" ] || [ "${generate}" == "neurostore-typescript-sdk" ]; then
    echo "generating typescript-neurostore-sdk (v${neurostore_version})..."
    run_generator \
        -i /local/neurostore-spec/neurostore-openapi.yml \
        -g typescript-axios \
        -o /local/typescript/neurostore-typescript-sdk \
        --additional-properties npmVersion="${neurostore_version}" \
        --openapi-normalizer REMOVE_X_INTERNAL=true,KEEP_ONLY_FIRST_TAG_IN_OPERATION=true
fi

if [ -z "${generate}" ] || [ "${generate}" == "python-neurosynth-compose" ] || [ "${generate}" == "neurosynth-compose-python-sdk" ]; then
    echo "generating python-neurosynth-compose-sdk (v${compose_version})..."
    clean_python_sdk "${script_dir}/python/neurosynth-compose-python-sdk" "neurosynth_compose_sdk"
    run_generator \
        -i /local/neurostore-spec/neurosynth-compose-openapi.yml \
        -g python \
        -c /local/neurosynth_compose_python_nextgen_sdk_config.json \
        -o /local/python/neurosynth-compose-python-sdk \
        -t /local/templates/python \
        --additional-properties packageVersion="${compose_version}" \
        --openapi-normalizer REMOVE_X_INTERNAL=true,KEEP_ONLY_FIRST_TAG_IN_OPERATION=true
    inject_python_helpers "${script_dir}/python/neurosynth-compose-python-sdk" "neurosynth_compose_sdk"
fi

if [ -z "${generate}" ] || [ "${generate}" == "typescript-neurosynth-compose" ] || [ "${generate}" == "neurosynth-compose-typescript-sdk" ]; then
    echo "generating typescript-neurosynth-compose-sdk (v${compose_version})..."
    run_generator \
        -i /local/neurostore-spec/neurosynth-compose-openapi.yml \
        -g typescript-axios \
        -o /local/typescript/neurosynth-compose-typescript-sdk \
        --additional-properties npmVersion="${compose_version}" \
        --openapi-normalizer REMOVE_X_INTERNAL=true,KEEP_ONLY_FIRST_TAG_IN_OPERATION=true
fi
