# athletix.api.PublicApi

## Load the API package
```dart
import 'package:athletix/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**citiesGet**](PublicApi.md#citiesget) | **GET** /cities | show all cities
[**tagsGet**](PublicApi.md#tagsget) | **GET** /tags | show all tags
[**uploadFilesPost**](PublicApi.md#uploadfilespost) | **POST** /upload/files | upload file(s)


# **citiesGet**
> Object citiesGet(lang)

show all cities

### Example
```dart
import 'package:athletix/api.dart';

final api_instance = PublicApi();
final lang = ar; // String | 

try {
    final result = api_instance.citiesGet(lang);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->citiesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lang** | **String**|  | [optional] 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tagsGet**
> Object tagsGet(lang)

show all tags

### Example
```dart
import 'package:athletix/api.dart';

final api_instance = PublicApi();
final lang = ar; // String | 

try {
    final result = api_instance.tagsGet(lang);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->tagsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lang** | **String**|  | [optional] 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadFilesPost**
> Object uploadFilesPost(filesLeftSquareBracket0RightSquareBracket)

upload file(s)

### Example
```dart
import 'package:athletix/api.dart';

final api_instance = PublicApi();
final filesLeftSquareBracket0RightSquareBracket = BINARY_DATA_HERE; // MultipartFile | 

try {
    final result = api_instance.uploadFilesPost(filesLeftSquareBracket0RightSquareBracket);
    print(result);
} catch (e) {
    print('Exception when calling PublicApi->uploadFilesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filesLeftSquareBracket0RightSquareBracket** | **MultipartFile**|  | [optional] 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

