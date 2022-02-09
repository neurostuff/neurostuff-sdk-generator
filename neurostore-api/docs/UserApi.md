# neurostore_api.UserApi

All URIs are relative to *http://localhost:80/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**users_get**](UserApi.md#users_get) | **GET** /users/ | Your GET endpoint
[**users_post**](UserApi.md#users_post) | **POST** /users/ | 


# **users_get**
> InlineResponse2006 users_get()

Your GET endpoint

get list of users

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_api
from neurostore_api.api import user_api
from neurostore_api.model.inline_response2006 import InlineResponse2006
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_api.Configuration(
    host = "http://localhost:80/api"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure Bearer authorization: JSON-Web-Token
configuration = neurostore_api.Configuration(
    access_token = 'YOUR_BEARER_TOKEN'
)

# Enter a context with an instance of the API client
with neurostore_api.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = user_api.UserApi(api_client)

    # example, this endpoint has no required or optional parameters
    try:
        # Your GET endpoint
        api_response = api_instance.users_get()
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling UserApi->users_get: %s\n" % e)
```


### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse2006**](InlineResponse2006.md)

### Authorization

[JSON-Web-Token](../README.md#JSON-Web-Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **users_post**
> User users_post()



create a user

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_api
from neurostore_api.api import user_api
from neurostore_api.model.user import User
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_api.Configuration(
    host = "http://localhost:80/api"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure Bearer authorization: JSON-Web-Token
configuration = neurostore_api.Configuration(
    access_token = 'YOUR_BEARER_TOKEN'
)

# Enter a context with an instance of the API client
with neurostore_api.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = user_api.UserApi(api_client)
    user = User(
        name="name_example",
        neuroid="neuroid_example",
    ) # User |  (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        api_response = api_instance.users_post(user=user)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling UserApi->users_post: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user** | [**User**](User.md)|  | [optional]

### Return type

[**User**](User.md)

### Authorization

[JSON-Web-Token](../README.md#JSON-Web-Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

