# neurostore_sdk.StudiesApi

All URIs are relative to *http://localhost:80/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**studies_get**](StudiesApi.md#studies_get) | **GET** /studies/ | GET a list of studies
[**studies_id_delete**](StudiesApi.md#studies_id_delete) | **DELETE** /studies/{id} | DELETE a study
[**studies_id_get**](StudiesApi.md#studies_id_get) | **GET** /studies/{id} | GET a study
[**studies_id_put**](StudiesApi.md#studies_id_put) | **PUT** /studies/{id} | PUT/update a study
[**studies_post**](StudiesApi.md#studies_post) | **POST** /studies/ | POST/create a study


# **studies_get**
> StudyList studies_get()

GET a list of studies

List studies

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import studies_api
from neurostore_sdk.model.study_list import StudyList
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
    api_instance = studies_api.StudiesApi(api_client)
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
    data_type = "coordinate" # str | whether searching for studies that contain coordinates, images, or both (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # GET a list of studies
        api_response = api_instance.studies_get(search=search, sort=sort, page=page, desc=desc, page_size=page_size, nested=nested, name=name, description=description, source_id=source_id, unique=unique, source=source, authors=authors, user_id=user_id, data_type=data_type)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudiesApi->studies_get: %s\n" % e)
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
 **data_type** | **str**| whether searching for studies that contain coordinates, images, or both | [optional]

### Return type

[**StudyList**](StudyList.md)

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

# **studies_id_delete**
> studies_id_delete(id)

DELETE a study

delete a study

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import studies_api
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
    api_instance = studies_api.StudiesApi(api_client)
    id = "id_example" # str | 

    # example passing only required values which don't have defaults set
    try:
        # DELETE a study
        api_instance.studies_id_delete(id)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudiesApi->studies_id_delete: %s\n" % e)
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

# **studies_id_get**
> StudyReturn studies_id_get(id)

GET a study

Get a study.

### Example


```python
import time
import neurostore_sdk
from neurostore_sdk.api import studies_api
from neurostore_sdk.model.study_return import StudyReturn
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
    api_instance = studies_api.StudiesApi(api_client)
    id = "id_example" # str | 
    nested = True # bool | whether to show the URI to a resource (false) or to embed the object in the response (true) (optional)

    # example passing only required values which don't have defaults set
    try:
        # GET a study
        api_response = api_instance.studies_id_get(id)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudiesApi->studies_id_get: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # GET a study
        api_response = api_instance.studies_id_get(id, nested=nested)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudiesApi->studies_id_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |
 **nested** | **bool**| whether to show the URI to a resource (false) or to embed the object in the response (true) | [optional]

### Return type

[**StudyReturn**](StudyReturn.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Study Found |  -  |
**404** | Example response |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **studies_id_put**
> StudyReturn studies_id_put(id)

PUT/update a study

Update a study.

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import studies_api
from neurostore_sdk.model.study import Study
from neurostore_sdk.model.study_return import StudyReturn
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
    api_instance = studies_api.StudiesApi(api_client)
    id = "id_example" # str | 
    study = Study(
        analyses=[
            None,
        ],
        doi="10.1016/S0926-6410(97)00020-7",
        name="Functional magnetic resonance imaging of category-specific cortical activation: evidence for semantic maps.",
        metadata={},
        description="description_example",
        publication="publication_example",
        pmid="pmid_example",
        public=True,
        authors="authors_example",
        source="source_example",
        source_id="source_id_example",
        source_updated_at="source_updated_at_example",
        year=1,
    ) # Study |  (optional)

    # example passing only required values which don't have defaults set
    try:
        # PUT/update a study
        api_response = api_instance.studies_id_put(id)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudiesApi->studies_id_put: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # PUT/update a study
        api_response = api_instance.studies_id_put(id, study=study)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudiesApi->studies_id_put: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |
 **study** | [**Study**](Study.md)|  | [optional]

### Return type

[**StudyReturn**](StudyReturn.md)

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

# **studies_post**
> StudyReturn studies_post()

POST/create a study

Create a study

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_sdk
from neurostore_sdk.api import studies_api
from neurostore_sdk.model.study import Study
from neurostore_sdk.model.study_return import StudyReturn
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
    api_instance = studies_api.StudiesApi(api_client)
    source = "neurostore" # str | the source of the resource you would like to filter/copy from (optional) if omitted the server will use the default value of "neurostore"
    source_id = "1234567890ab" # str | id of the resource you are either filtering/copying on (optional)
    study = Study(
        analyses=[
            None,
        ],
        doi="10.1016/S0926-6410(97)00020-7",
        name="Functional magnetic resonance imaging of category-specific cortical activation: evidence for semantic maps.",
        metadata={},
        description="description_example",
        publication="publication_example",
        pmid="pmid_example",
        public=True,
        authors="authors_example",
        source="source_example",
        source_id="source_id_example",
        source_updated_at="source_updated_at_example",
        year=1,
    ) # Study |  (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # POST/create a study
        api_response = api_instance.studies_post(source=source, source_id=source_id, study=study)
        pprint(api_response)
    except neurostore_sdk.ApiException as e:
        print("Exception when calling StudiesApi->studies_post: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **source** | **str**| the source of the resource you would like to filter/copy from | [optional] if omitted the server will use the default value of "neurostore"
 **source_id** | **str**| id of the resource you are either filtering/copying on | [optional]
 **study** | [**Study**](Study.md)|  | [optional]

### Return type

[**StudyReturn**](StudyReturn.md)

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

