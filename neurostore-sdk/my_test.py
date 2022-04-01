import neurostore_sdk
from neurostore_sdk.api_client import ApiClient

configuration = neurostore_sdk.Configuration(
    host = "https://neurostore.xyz/api"
)

client = ApiClient(configuration=configuration)

dsets = client.studysets.get(nested=False)

dsets.to_dict()

