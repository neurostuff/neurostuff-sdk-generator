# neurostore_sdk.StudysetsApi

All URIs are relative to *http://localhost:80/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**studysets_get**](StudysetsApi.md#studysets_get) | **GET** /studysets/ | GET a list of studysets
[**studysets_id_delete**](StudysetsApi.md#studysets_id_delete) | **DELETE** /studysets/{id} | DELETE a studyset
[**studysets_id_get**](StudysetsApi.md#studysets_id_get) | **GET** /studysets/{id} | GET a studyset
[**studysets_id_put**](StudysetsApi.md#studysets_id_put) | **PUT** /studysets/{id} | PUT/update a studyset
[**studysets_post**](StudysetsApi.md#studysets_post) | **POST** /studysets/ | POST/create a studyset


# **studysets_get**
> StudysetList studysets_get()

GET a list of studysets

Get a list of studysets.

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import studysets_api
from neurostore_sdk.model.studyset_list import StudysetList
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
    api_instance = studysets_api.StudysetsApi(api_client)
    search = "imagin" # str | search for entries that contain the substring (optional)
    sort = "created_at" # str | Parameter to sort results on (optional) if omitted the server will use the default value of "created_at"
    page = 0 # int | page of results (optional)
    desc = True # bool | sort results by descending order (as opposed to ascending order) (optional)
    page_size = 1 # int | number of results to show on a page (optional)
    nested = True # bool | whether to show the URI to a resource (false) or to embed the object in the response (true) (optional)
    name = "name_example" # str | search the name field for a term (optional)
    description = "description_example" # str | search description field for a term (optional)
    source_id = "1234567890ab" # str | id of the resource you are either filtering/copying on (optional)
    unique = True # bool | whether to list clones with originals (optional)
    source = "neurostore" # str | the source of the resource you would like to filter/copy from (optional) if omitted the server will use the default value of "neurostore"
    authors = "authors_example" # str | search authors (optional)
    user_id = "user_id_example" # str | user id you want to filter by (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # GET a list of studysets
        api_response = api_instance.studysets_get(search=search, sort=sort, page=page, desc=desc, page_size=page_size, nested=nested, name=name, description=description, source_id=source_id, unique=unique, source=source, authors=authors, user_id=user_id)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudysetsApi->studysets_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **str**| search for entries that contain the substring | [optional]
 **sort** | **str**| Parameter to sort results on | [optional] if omitted the server will use the default value of "created_at"
 **page** | **int**| page of results | [optional]
 **desc** | **bool**| sort results by descending order (as opposed to ascending order) | [optional]
 **page_size** | **int**| number of results to show on a page | [optional]
 **nested** | **bool**| whether to show the URI to a resource (false) or to embed the object in the response (true) | [optional]
 **name** | **str**| search the name field for a term | [optional]
 **description** | **str**| search description field for a term | [optional]
 **source_id** | **str**| id of the resource you are either filtering/copying on | [optional]
 **unique** | **bool**| whether to list clones with originals | [optional]
 **source** | **str**| the source of the resource you would like to filter/copy from | [optional] if omitted the server will use the default value of "neurostore"
 **authors** | **str**| search authors | [optional]
 **user_id** | **str**| user id you want to filter by | [optional]

### Return type

[**StudysetList**](StudysetList.md)

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

# **studysets_id_delete**
> studysets_id_delete(id)

DELETE a studyset

delete a studyset

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import studysets_api
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
    api_instance = studysets_api.StudysetsApi(api_client)
    id = "id_example" # str | 

    # example passing only required values which don't have defaults set
    try:
        # DELETE a studyset
        api_instance.studysets_id_delete(id)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudysetsApi->studysets_id_delete: %s\n" % e)
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

# **studysets_id_get**
> StudysetReturn studysets_id_get(id)

GET a studyset

Retrieve the information of a studyset with the matching studyset ID.

### Example


```python
import time
import neurostore_sdk
from neurostore_sdk.api import studysets_api
from neurostore_sdk.model.studyset_return import StudysetReturn
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
    api_instance = studysets_api.StudysetsApi(api_client)
    id = "id_example" # str | 
    nested = True # bool | whether to show the URI to a resource (false) or to embed the object in the response (true) (optional)

    # example passing only required values which don't have defaults set
    try:
        # GET a studyset
        api_response = api_instance.studysets_id_get(id)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudysetsApi->studysets_id_get: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # GET a studyset
        api_response = api_instance.studysets_id_get(id, nested=nested)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudysetsApi->studysets_id_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |
 **nested** | **bool**| whether to show the URI to a resource (false) or to embed the object in the response (true) | [optional]

### Return type

[**StudysetReturn**](StudysetReturn.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | studyset found |  -  |
**404** | Example response |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **studysets_id_put**
> StudysetReturn studysets_id_put(id)

PUT/update a studyset

Update a studyset.

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import studysets_api
from neurostore_sdk.model.studyset_return import StudysetReturn
from neurostore_sdk.model.inline_response422 import InlineResponse422
from neurostore_sdk.model.studyset import Studyset
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
    api_instance = studysets_api.StudysetsApi(api_client)
    id = "id_example" # str | 
    studyset = Studyset(
        name="name_example",
        description="description_example",
        publication="publication_example",
        doi="doi_example",
        pmid="pmid_example",
        studies=[
            None,
        ],
        public=True,
    ) # Studyset |  (optional)

    # example passing only required values which don't have defaults set
    try:
        # PUT/update a studyset
        api_response = api_instance.studysets_id_put(id)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudysetsApi->studysets_id_put: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # PUT/update a studyset
        api_response = api_instance.studysets_id_put(id, studyset=studyset)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudysetsApi->studysets_id_put: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |
 **studyset** | [**Studyset**](Studyset.md)|  | [optional]

### Return type

[**StudysetReturn**](StudysetReturn.md)

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

# **studysets_post**
> StudysetReturn studysets_post()

POST/create a studyset

Create a studyset.

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import studysets_api
from neurostore_sdk.model.studyset_return import StudysetReturn
from neurostore_sdk.model.studyset import Studyset
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
    api_instance = studysets_api.StudysetsApi(api_client)
    studyset = Studyset(
        name="name_example",
        description="description_example",
        publication="publication_example",
        doi="doi_example",
        pmid="pmid_example",
        studies=[
            None,
        ],
        public=True,
    ) # Studyset |  (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # POST/create a studyset
        api_response = api_instance.studysets_post(studyset=studyset)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudysetsApi->studysets_post: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **studyset** | [**Studyset**](Studyset.md)|  | [optional]

### Return type

[**StudysetReturn**](StudysetReturn.md)

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

