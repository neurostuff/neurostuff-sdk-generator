# AnalysisReturn


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**conditions** | **[bool, date, datetime, dict, float, int, list, str, none_type]** | array of conditions (e.g., 2-back, memory, etc.) that must be the same length as weight. | [optional] 
**images** | **[bool, date, datetime, dict, float, int, list, str, none_type]** |  | [optional] 
**name** | **str, none_type** |  | [optional] 
**points** | **[bool, date, datetime, dict, float, int, list, str, none_type]** |  | [optional] 
**weights** | **[float]** | weight applied to each condition, must be the same length as condition | [optional] 
**description** | **str, none_type** |  | [optional] 
**study** | **str** |  | [optional] 
**id** | **str** | short UUID specifying the location of this resource | [optional] 
**created_at** | **datetime** | time the resource was created on the database | [optional] [readonly] 
**user** | **str, none_type** | who owns the resource | [optional] [readonly] 
**any string name** | **bool, date, datetime, dict, float, int, list, str, none_type** | any string name can be used but the value must be the correct type | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


