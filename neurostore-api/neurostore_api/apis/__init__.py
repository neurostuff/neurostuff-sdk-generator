
# flake8: noqa

# Import all APIs into this package.
# If you have many APIs here with many many models used in each API this may
# raise a `RecursionError`.
# In order to avoid this, import only the API that you directly need like:
#
#   from .api.analyses_api import AnalysesApi
#
# or import this package, but before doing it, use:
#
#   import sys
#   sys.setrecursionlimit(n)

# Import APIs into API package:
from neurostore_api.api.analyses_api import AnalysesApi
from neurostore_api.api.annotations_api import AnnotationsApi
from neurostore_api.api.conditions_api import ConditionsApi
from neurostore_api.api.datasets_api import DatasetsApi
from neurostore_api.api.images_api import ImagesApi
from neurostore_api.api.points_api import PointsApi
from neurostore_api.api.studies_api import StudiesApi
from neurostore_api.api.user_api import UserApi
