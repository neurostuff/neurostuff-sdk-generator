# neurostore_api.AnnotationsApi

All URIs are relative to *http://localhost:80/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**annotations_get**](AnnotationsApi.md#annotations_get) | **GET** /annotations/ | Your GET endpoint
[**annotations_id_delete**](AnnotationsApi.md#annotations_id_delete) | **DELETE** /annotations/{id} | DELETE an annotation
[**annotations_id_get**](AnnotationsApi.md#annotations_id_get) | **GET** /annotations/{id} | Your GET endpoint
[**annotations_id_put**](AnnotationsApi.md#annotations_id_put) | **PUT** /annotations/{id} | Update an annotation
[**annotations_post**](AnnotationsApi.md#annotations_post) | **POST** /annotations/ | Post Annotation


# **annotations_get**
> InlineResponse2007 annotations_get()

Your GET endpoint

get annotations for an available dataset

### Example


```python
import time
import neurostore_api
from neurostore_api.api import annotations_api
from neurostore_api.model.inline_response2007 import InlineResponse2007
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_api.Configuration(
    host = "http://localhost:80/api"
)


# Enter a context with an instance of the API client
with neurostore_api.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = annotations_api.AnnotationsApi(api_client)
    dataset_id = "dataset_id_example" # str | see all annotations connected to this dataset (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # Your GET endpoint
        api_response = api_instance.annotations_get(dataset_id=dataset_id)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnnotationsApi->annotations_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dataset_id** | **str**| see all annotations connected to this dataset | [optional]

### Return type

[**InlineResponse2007**](InlineResponse2007.md)

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

# **annotations_id_delete**
> annotations_id_delete(id)

DELETE an annotation

delete annotation

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_api
from neurostore_api.api import annotations_api
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
    api_instance = annotations_api.AnnotationsApi(api_client)
    id = "id_example" # str | 

    # example passing only required values which don't have defaults set
    try:
        # DELETE an annotation
        api_instance.annotations_id_delete(id)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnnotationsApi->annotations_id_delete: %s\n" % e)
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

# **annotations_id_get**
> bool, date, datetime, dict, float, int, list, str, none_type annotations_id_get(id)

Your GET endpoint

get an individual annotation

### Example


```python
import time
import neurostore_api
from neurostore_api.api import annotations_api
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_api.Configuration(
    host = "http://localhost:80/api"
)


# Enter a context with an instance of the API client
with neurostore_api.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = annotations_api.AnnotationsApi(api_client)
    id = "id_example" # str | 
    export = True # bool | return endpoint data in consumable/readable format (optional)

    # example passing only required values which don't have defaults set
    try:
        # Your GET endpoint
        api_response = api_instance.annotations_id_get(id)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnnotationsApi->annotations_id_get: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # Your GET endpoint
        api_response = api_instance.annotations_id_get(id, export=export)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnnotationsApi->annotations_id_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |
 **export** | **bool**| return endpoint data in consumable/readable format | [optional]

### Return type

**bool, date, datetime, dict, float, int, list, str, none_type**

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

# **annotations_id_put**
> Annotation annotations_id_put(id)

Update an annotation

edit an existing annotation

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_api
from neurostore_api.api import annotations_api
from neurostore_api.model.annotation import Annotation
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
    api_instance = annotations_api.AnnotationsApi(api_client)
    id = "id_example" # str | 

    # example passing only required values which don't have defaults set
    try:
        # Update an annotation
        api_response = api_instance.annotations_id_put(id)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnnotationsApi->annotations_id_put: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |

### Return type

[**Annotation**](Annotation.md)

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

# **annotations_post**
> Annotation annotations_post()

Post Annotation

Create an annotation

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_api
from neurostore_api.api import annotations_api
from neurostore_api.model.annotation import Annotation
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
    api_instance = annotations_api.AnnotationsApi(api_client)
    source = "neurostore" # str | the source of the resource you would like to filter/copy from (optional) if omitted the server will use the default value of "neurostore"
    source_id = "1234567890ab" # str | id of the resource you are either filtering/copying on (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # Post Annotation
        api_response = api_instance.annotations_post(source=source, source_id=source_id)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnnotationsApi->annotations_post: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **source** | **str**| the source of the resource you would like to filter/copy from | [optional] if omitted the server will use the default value of "neurostore"
 **source_id** | **str**| id of the resource you are either filtering/copying on | [optional]

### Return type

[**Annotation**](Annotation.md)

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

