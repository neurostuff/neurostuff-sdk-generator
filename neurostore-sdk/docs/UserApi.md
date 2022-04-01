# neurostore_sdk.UserApi

All URIs are relative to *http://localhost:80/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**users_get**](UserApi.md#users_get) | **GET** /users/ | Your GET endpoint
[**users_id_get**](UserApi.md#users_id_get) | **GET** /users/{id} | Individual User Profile
[**users_id_put**](UserApi.md#users_id_put) | **PUT** /users/{id} | Update Individual Profile
[**users_post**](UserApi.md#users_post) | **POST** /users/ | 


# **users_get**
> UserList users_get()

Your GET endpoint

get list of users

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import user_api
from neurostore_sdk.model.user_list import UserList
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_sdk.Configuration(
    host = "http://localhost:80/api"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure Bearer authorization: JSON-Web-Token
configuration = neurostore_sdk.Configuration(
    access_token = 'YOUR_BEARER_TOKEN'
)

# Enter a context with an instance of the API client
with neurostore_sdk.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = user_api.UserApi(api_client)

    # example, this endpoint has no required or optional parameters
    try:
        # Your GET endpoint
        api_response = api_instance.users_get()
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling UserApi->users_get: %s\n" % e)
```


### Parameters
This endpoint does not need any parameter.

### Return type

[**UserList**](UserList.md)

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

# **users_id_get**
> User users_id_get(id)

Individual User Profile

get an individual user

### Example


```python
import time
import neurostore_sdk
from neurostore_sdk.api import user_api
from neurostore_sdk.model.user import User
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_sdk.Configuration(
    host = "http://localhost:80/api"
)


# Enter a context with an instance of the API client
with neurostore_sdk.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = user_api.UserApi(api_client)
    id = "id_example" # str | 

    # example passing only required values which don't have defaults set
    try:
        # Individual User Profile
        api_response = api_instance.users_id_get(id)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling UserApi->users_id_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **users_id_put**
> User users_id_put(id)

Update Individual Profile

update an individual user

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import user_api
from neurostore_sdk.model.user import User
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_sdk.Configuration(
    host = "http://localhost:80/api"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure Bearer authorization: JSON-Web-Token
configuration = neurostore_sdk.Configuration(
    access_token = 'YOUR_BEARER_TOKEN'
)

# Enter a context with an instance of the API client
with neurostore_sdk.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = user_api.UserApi(api_client)
    id = "id_example" # str | 
    user = User(
        name="name_example",
        neuroid="neuroid_example",
    ) # User |  (optional)

    # example passing only required values which don't have defaults set
    try:
        # Update Individual Profile
        api_response = api_instance.users_id_put(id)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling UserApi->users_id_put: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # Update Individual Profile
        api_response = api_instance.users_id_put(id, user=user)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling UserApi->users_id_put: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |
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

# **users_post**
> User users_post()



create a user

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import user_api
from neurostore_sdk.model.user import User
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_sdk.Configuration(
    host = "http://localhost:80/api"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure Bearer authorization: JSON-Web-Token
configuration = neurostore_sdk.Configuration(
    access_token = 'YOUR_BEARER_TOKEN'
)

# Enter a context with an instance of the API client
with neurostore_sdk.ApiClient(configuration) as api_client:
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
    except neurostore_sdk.ApiException as e:
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

