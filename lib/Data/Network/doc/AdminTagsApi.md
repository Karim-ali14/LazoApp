# athletix.api.AdminTagsApi

## Load the API package
```dart
import 'package:athletix/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminTagCreatePost**](AdminTagsApi.md#admintagcreatepost) | **POST** /admin/tag/create | create a tag
[**adminTagDeleteDelete**](AdminTagsApi.md#admintagdeletedelete) | **DELETE** /admin/tag/delete | delete a tag
[**adminTagUpdatePost**](AdminTagsApi.md#admintagupdatepost) | **POST** /admin/tag/update | update a tag


# **adminTagCreatePost**
> Object adminTagCreatePost(nameEn, nameAr)

create a tag

### Example
```dart
import 'package:athletix/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminTagsApi();
final nameEn = nameEn_example; // String | 
final nameAr = nameAr_example; // String | 

try {
    final result = api_instance.adminTagCreatePost(nameEn, nameAr);
    print(result);
} catch (e) {
    print('Exception when calling AdminTagsApi->adminTagCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nameEn** | **String**|  | [optional] 
 **nameAr** | **String**|  | [optional] 

### Return type

[**Object**](Object.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminTagDeleteDelete**
> adminTagDeleteDelete(tagId)

delete a tag

### Example
```dart
import 'package:athletix/api.dart';

final api_instance = AdminTagsApi();
final tagId = 3; // int | 

try {
    api_instance.adminTagDeleteDelete(tagId);
} catch (e) {
    print('Exception when calling AdminTagsApi->adminTagDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagId** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminTagUpdatePost**
> Object adminTagUpdatePost(tagId, nameEn, nameAr)

update a tag

### Example
```dart
import 'package:athletix/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminTagsApi();
final tagId = 56; // int | 
final nameEn = nameEn_example; // String | 
final nameAr = nameAr_example; // String | 

try {
    final result = api_instance.adminTagUpdatePost(tagId, nameEn, nameAr);
    print(result);
} catch (e) {
    print('Exception when calling AdminTagsApi->adminTagUpdatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tagId** | **int**|  | [optional] 
 **nameEn** | **String**|  | [optional] 
 **nameAr** | **String**|  | [optional] 

### Return type

[**Object**](Object.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

