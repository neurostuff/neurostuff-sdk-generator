import neurostore_api
from neurostore_api.api_client import ApiClient
from neurostore_api.api import datasets_api

configuration = neurostore_api.Configuration(
    host = "https://neurostore.xyz/api"
)

client = ApiClient(configuration=configuration)

dset_api = datasets_api.DatasetsApi()

dsets = dset_api.get(nested=True)

dsets.to_dict()

