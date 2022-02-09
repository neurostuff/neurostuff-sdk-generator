import neurostore_api
from neurostore_api.api import datasets_api

configuration = neurostore_api.Configuration(
    host = "http://localhost:80/api"
)

dset_api = datasets_api.DatasetsApi()

dsets = dset_api.datasets_get(nested=True)

dsets.to_dict()

