# neurostore_api.PointsApi

All URIs are relative to *http://localhost:80/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**points_get**](PointsApi.md#points_get) | **GET** /points/ | Get Points
[**points_id_delete**](PointsApi.md#points_id_delete) | **DELETE** /points/{id} | DELETE a point
[**points_id_get**](PointsApi.md#points_id_get) | **GET** /points/{id} | GET a point
[**points_id_put**](PointsApi.md#points_id_put) | **PUT** /points/{id} | PUT/update a point
[**points_post**](PointsApi.md#points_post) | **POST** /points/ | POST Points


# **points_get**
> PointList points_get()

Get Points

list points in database

### Example


```python
import time
import neurostore_api
from neurostore_api.api import points_api
from neurostore_api.model.point_list import PointList
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_api.Configuration(
    host = "http://localhost:80/api"
)


# Enter a context with an instance of the API client
with neurostore_api.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = points_api.PointsApi(api_client)

    # example, this endpoint has no required or optional parameters
    try:
        # Get Points
        api_response = api_instance.points_get()
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling PointsApi->points_get: %s\n" % e)
```


### Parameters
This endpoint does not need any parameter.

### Return type

[**PointList**](PointList.md)

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

# **points_id_delete**
> points_id_delete(id)

DELETE a point

delete a point

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_api
from neurostore_api.api import points_api
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
    api_instance = points_api.PointsApi(api_client)
    id = "id_example" # str | 

    # example passing only required values which don't have defaults set
    try:
        # DELETE a point
        api_instance.points_id_delete(id)
    except neurostore_api.ApiException as e:
        print("Exception when calling PointsApi->points_id_delete: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |

### Return type

void (empty response body)

### Authorization

[JSON-Web-Token](../README.md#JSON-Web-Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **points_id_get**
> PointReturn points_id_get(id)

GET a point

Information about a particular MRI coordinate

### Example


```python
import time
import neurostore_api
from neurostore_api.api import points_api
from neurostore_api.model.point_return import PointReturn
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_api.Configuration(
    host = "http://localhost:80/api"
)


# Enter a context with an instance of the API client
with neurostore_api.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = points_api.PointsApi(api_client)
    id = "id_example" # str | 

    # example passing only required values which don't have defaults set
    try:
        # GET a point
        api_response = api_instance.points_id_get(id)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling PointsApi->points_id_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |

### Return type

[**PointReturn**](PointReturn.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |
**404** | Not Found |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **points_id_put**
> PointReturn points_id_put(id)

PUT/update a point

Update a particular MRI coordinate.

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_api
from neurostore_api.api import points_api
from neurostore_api.model.point import Point
from neurostore_api.model.point_return import PointReturn
from neurostore_api.model.inline_response422 import InlineResponse422
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
    api_instance = points_api.PointsApi(api_client)
    id = "id_example" # str | 
    point = Point(
        coordinates=[
            63,
        ],
        space="UNKNOWN",
        kind="kind_example",
        x=3.14,
        y=3.14,
        z=3.14,
        analysis="6kwPw6p79Ljm",
        image="image_example",
        label_id="label_id_example",
        value=[
            None,
        ],
    ) # Point |  (optional)

    # example passing only required values which don't have defaults set
    try:
        # PUT/update a point
        api_response = api_instance.points_id_put(id)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling PointsApi->points_id_put: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # PUT/update a point
        api_response = api_instance.points_id_put(id, point=point)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling PointsApi->points_id_put: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |
 **point** | [**Point**](Point.md)|  | [optional]

### Return type

[**PointReturn**](PointReturn.md)

### Authorization

[JSON-Web-Token](../README.md#JSON-Web-Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |
**422** | Example response |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **points_post**
> PointReturn points_post()

POST Points

add a point to an analysis

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_api
from neurostore_api.api import points_api
from neurostore_api.model.point import Point
from neurostore_api.model.point_return import PointReturn
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
    api_instance = points_api.PointsApi(api_client)
    point = Point(
        coordinates=[
            63,
        ],
        space="UNKNOWN",
        kind="kind_example",
        x=3.14,
        y=3.14,
        z=3.14,
        analysis="6kwPw6p79Ljm",
        image="image_example",
        label_id="label_id_example",
        value=[
            None,
        ],
    ) # Point |  (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # POST Points
        api_response = api_instance.points_post(point=point)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling PointsApi->points_post: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **point** | [**Point**](Point.md)|  | [optional]

### Return type

[**PointReturn**](PointReturn.md)

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

