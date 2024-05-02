# athletix.api.AdminCityApi

## Load the API package
```dart
import 'package:athletix/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminCityCreatePost**](AdminCityApi.md#admincitycreatepost) | **POST** /admin/city/create | update city
[**adminCityDeleteDelete**](AdminCityApi.md#admincitydeletedelete) | **DELETE** /admin/city/delete | delete city


# **adminCityCreatePost**
> Object adminCityCreatePost(cityId, nameEn, nameAr)

update city

### Example
```dart
import 'package:athletix/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminCityApi();
final cityId = 56; // int | 
final nameEn = nameEn_example; // String | 
final nameAr = nameAr_example; // String | 

try {
    final result = api_instance.adminCityCreatePost(cityId, nameEn, nameAr);
    print(result);
} catch (e) {
    print('Exception when calling AdminCityApi->adminCityCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **int**|  | [optional] 
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

# **adminCityDeleteDelete**
> adminCityDeleteDelete(cityId)

delete city

### Example
```dart
import 'package:athletix/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminCityApi();
final cityId = 3; // int | 

try {
    api_instance.adminCityDeleteDelete(cityId);
} catch (e) {
    print('Exception when calling AdminCityApi->adminCityDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

