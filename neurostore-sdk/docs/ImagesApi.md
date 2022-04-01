# neurostore_sdk.ImagesApi

All URIs are relative to *http://localhost:80/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**images_get**](ImagesApi.md#images_get) | **GET** /images/ | GET a list of images
[**images_id_delete**](ImagesApi.md#images_id_delete) | **DELETE** /images/{id} | DELETE an image
[**images_id_get**](ImagesApi.md#images_id_get) | **GET** /images/{id} | GET an image
[**images_id_put**](ImagesApi.md#images_id_put) | **PUT** /images/{id} | PUT/update an image
[**images_post**](ImagesApi.md#images_post) | **POST** /images/ | POST/create an image


# **images_get**
> ImageList images_get()

GET a list of images

Retrieve and list images.

### Example


```python
import time
import neurostore_sdk
from neurostore_sdk.api import images_api
from neurostore_sdk.model.image_list import ImageList
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_sdk.Configuration(
    host = "http://localhost:80/api"
)


# Enter a context with an instance of the API client
with neurostore_sdk.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = images_api.ImagesApi(api_client)
    search = "imagin" # str | search for entries that contain the substring (optional)
    sort = "created_at" # str | Parameter to sort results on (optional) if omitted the server will use the default value of "created_at"
    page = 0 # int | page of results (optional)
    desc = True # bool | sort results by descending order (as opposed to ascending order) (optional)
    page_size = 1 # int | number of results to show on a page (optional)
    filename = "filename_example" # str | search filename field (optional)
    analysis_name = "analysis_name_example" # str | search analysis_name field (optional)
    value_type = "value_type_example" # str | search value_type field (optional)
    space = "space_example" # str | search space field (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # GET a list of images
        api_response = api_instance.images_get(search=search, sort=sort, page=page, desc=desc, page_size=page_size, filename=filename, analysis_name=analysis_name, value_type=value_type, space=space)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling ImagesApi->images_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **str**| search for entries that contain the substring | [optional]
 **sort** | **str**| Parameter to sort results on | [optional] if omitted the server will use the default value of "created_at"
 **page** | **int**| page of results | [optional]
 **desc** | **bool**| sort results by descending order (as opposed to ascending order) | [optional]
 **page_size** | **int**| number of results to show on a page | [optional]
 **filename** | **str**| search filename field | [optional]
 **analysis_name** | **str**| search analysis_name field | [optional]
 **value_type** | **str**| search value_type field | [optional]
 **space** | **str**| search space field | [optional]

### Return type

[**ImageList**](ImageList.md)

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

# **images_id_delete**
> images_id_delete(id)

DELETE an image

delete an image

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import images_api
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
    api_instance = images_api.ImagesApi(api_client)
    id = "id_example" # str | 

    # example passing only required values which don't have defaults set
    try:
        # DELETE an image
        api_instance.images_id_delete(id)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling ImagesApi->images_id_delete: %s\n" % e)
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

# **images_id_get**
> ImageReturn images_id_get(id)

GET an image

Retrieve information about a particular image from an analysis.

### Example


```python
import time
import neurostore_sdk
from neurostore_sdk.api import images_api
from neurostore_sdk.model.image_return import ImageReturn
from neurostore_sdk.model.inline_response404 import InlineResponse404
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_sdk.Configuration(
    host = "http://localhost:80/api"
)


# Enter a context with an instance of the API client
with neurostore_sdk.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = images_api.ImagesApi(api_client)
    id = "id_example" # str | 

    # example passing only required values which don't have defaults set
    try:
        # GET an image
        api_response = api_instance.images_id_get(id)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling ImagesApi->images_id_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |

### Return type

[**ImageReturn**](ImageReturn.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |
**404** | Example response |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **images_id_put**
> ImageReturn images_id_put(id)

PUT/update an image

Update a specific image.

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import images_api
from neurostore_sdk.model.image_return import ImageReturn
from neurostore_sdk.model.image import Image
from neurostore_sdk.model.inline_response422 import InlineResponse422
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
    api_instance = images_api.ImagesApi(api_client)
    id = "id_example" # str | 
    image = Image(
        metadata={},
        url="https://neurovault.org/media/images/4778/Positive_RPEs_zstat.nii.gz",
        filename="Positive_RPEs_zstat.nii.gz",
        space="TAL",
        value_type="Z",
        analysis="7UvrsaALJU9g",
    ) # Image |  (optional)

    # example passing only required values which don't have defaults set
    try:
        # PUT/update an image
        api_response = api_instance.images_id_put(id)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling ImagesApi->images_id_put: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # PUT/update an image
        api_response = api_instance.images_id_put(id, image=image)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling ImagesApi->images_id_put: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |
 **image** | [**Image**](Image.md)|  | [optional]

### Return type

[**ImageReturn**](ImageReturn.md)

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

# **images_post**
> ImageReturn images_post()

POST/create an image

Create an image

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import images_api
from neurostore_sdk.model.image_return import ImageReturn
from neurostore_sdk.model.image import Image
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
    api_instance = images_api.ImagesApi(api_client)
    image = Image(
        metadata={},
        url="https://neurovault.org/media/images/4778/Positive_RPEs_zstat.nii.gz",
        filename="Positive_RPEs_zstat.nii.gz",
        space="TAL",
        value_type="Z",
        analysis="7UvrsaALJU9g",
    ) # Image |  (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # POST/create an image
        api_response = api_instance.images_post(image=image)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling ImagesApi->images_post: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **image** | [**Image**](Image.md)|  | [optional]

### Return type

[**ImageReturn**](ImageReturn.md)

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

