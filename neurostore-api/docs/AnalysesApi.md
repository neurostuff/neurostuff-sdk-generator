# neurostore_api.AnalysesApi

All URIs are relative to *http://localhost:80/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**analyses_get**](AnalysesApi.md#analyses_get) | **GET** /analyses/ | GET list of analyses
[**analyses_id_delete**](AnalysesApi.md#analyses_id_delete) | **DELETE** /analyses/{id} | DELETE an analysis
[**analyses_id_get**](AnalysesApi.md#analyses_id_get) | **GET** /analyses/{id} | GET an analysis
[**analyses_id_put**](AnalysesApi.md#analyses_id_put) | **PUT** /analyses/{id} | PUT/update an analysis
[**analyses_post**](AnalysesApi.md#analyses_post) | **POST** /analyses/ | POST/create an analysis


# **analyses_get**
> InlineResponse2001 analyses_get()

GET list of analyses

List all analyses performed across studies.

### Example


```python
import time
import neurostore_api
from neurostore_api.api import analyses_api
from neurostore_api.model.inline_response2001 import InlineResponse2001
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_api.Configuration(
    host = "http://localhost:80/api"
)


# Enter a context with an instance of the API client
with neurostore_api.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = analyses_api.AnalysesApi(api_client)
    search = "imagin" # str | search for entries that contain the substring (optional)
    sort = "created_at" # str | Parameter to sort results on (optional) if omitted the server will use the default value of "created_at"
    page = 0 # int | page of results (optional)
    desc = True # bool | sort results by descending order (as opposed to ascending order) (optional)
    page_size = 1 # int | number of results to show on a page (optional)
    name = "name_example" # str | search the name field for a term (optional)
    description = "description_example" # str | search description field for a term (optional)
    nested = True # bool | whether to show the URI to a resource (false) or to embed the object in the response (true) (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # GET list of analyses
        api_response = api_instance.analyses_get(search=search, sort=sort, page=page, desc=desc, page_size=page_size, name=name, description=description, nested=nested)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnalysesApi->analyses_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **str**| search for entries that contain the substring | [optional]
 **sort** | **str**| Parameter to sort results on | [optional] if omitted the server will use the default value of "created_at"
 **page** | **int**| page of results | [optional]
 **desc** | **bool**| sort results by descending order (as opposed to ascending order) | [optional]
 **page_size** | **int**| number of results to show on a page | [optional]
 **name** | **str**| search the name field for a term | [optional]
 **description** | **str**| search description field for a term | [optional]
 **nested** | **bool**| whether to show the URI to a resource (false) or to embed the object in the response (true) | [optional]

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

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

# **analyses_id_delete**
> analyses_id_delete(id)

DELETE an analysis

delete an analysis

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_api
from neurostore_api.api import analyses_api
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
    api_instance = analyses_api.AnalysesApi(api_client)
    id = "id_example" # str | 

    # example passing only required values which don't have defaults set
    try:
        # DELETE an analysis
        api_instance.analyses_id_delete(id)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnalysesApi->analyses_id_delete: %s\n" % e)
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

# **analyses_id_get**
> bool, date, datetime, dict, float, int, list, str, none_type analyses_id_get(id)

GET an analysis

Information pertaining to a particular analysis within a study.

### Example


```python
import time
import neurostore_api
from neurostore_api.api import analyses_api
from neurostore_api.model.inline_response404 import InlineResponse404
from pprint import pprint
# Defining the host is optional and defaults to http://localhost:80/api
# See configuration.py for a list of all supported configuration parameters.
configuration = neurostore_api.Configuration(
    host = "http://localhost:80/api"
)


# Enter a context with an instance of the API client
with neurostore_api.ApiClient() as api_client:
    # Create an instance of the API class
    api_instance = analyses_api.AnalysesApi(api_client)
    id = "id_example" # str | 
    nested = True # bool | whether to show the URI to a resource (false) or to embed the object in the response (true) (optional)

    # example passing only required values which don't have defaults set
    try:
        # GET an analysis
        api_response = api_instance.analyses_id_get(id)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnalysesApi->analyses_id_get: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # GET an analysis
        api_response = api_instance.analyses_id_get(id, nested=nested)
        pprint(api_response)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnalysesApi->analyses_id_get: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |
 **nested** | **bool**| whether to show the URI to a resource (false) or to embed the object in the response (true) | [optional]

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
**404** | Example response |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **analyses_id_put**
> analyses_id_put(id)

PUT/update an analysis

Update an existing analysis.

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_api
from neurostore_api.api import analyses_api
from neurostore_api.model.analysis import Analysis
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
    api_instance = analyses_api.AnalysesApi(api_client)
    id = "id_example" # str | 
    analysis = Analysis(
        conditions=[
            None,
        ],
        images=[
            None,
        ],
        name="20356",
        points=[
            None,
        ],
        weights=[
            3.14,
        ],
        description="description_example",
        study="38jobTomPDqt",
    ) # Analysis |  (optional)

    # example passing only required values which don't have defaults set
    try:
        # PUT/update an analysis
        api_instance.analyses_id_put(id)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnalysesApi->analyses_id_put: %s\n" % e)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # PUT/update an analysis
        api_instance.analyses_id_put(id, analysis=analysis)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnalysesApi->analyses_id_put: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**|  |
 **analysis** | [**Analysis**](Analysis.md)|  | [optional]

### Return type

void (empty response body)

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

# **analyses_post**
> analyses_post()

POST/create an analysis

create an analysis

### Example

* Bearer Authentication (JSON-Web-Token):

```python
import time
import neurostore_api
from neurostore_api.api import analyses_api
from neurostore_api.model.analysis import Analysis
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
    api_instance = analyses_api.AnalysesApi(api_client)
    analysis = Analysis(
        conditions=[
            None,
        ],
        images=[
            None,
        ],
        name="20356",
        points=[
            None,
        ],
        weights=[
            3.14,
        ],
        description="description_example",
        study="38jobTomPDqt",
    ) # Analysis |  (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # POST/create an analysis
        api_instance.analyses_post(analysis=analysis)
    except neurostore_api.ApiException as e:
        print("Exception when calling AnalysesApi->analyses_post: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **analysis** | [**Analysis**](Analysis.md)|  | [optional]

### Return type

void (empty response body)

### Authorization

[JSON-Web-Token](../README.md#JSON-Web-Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

