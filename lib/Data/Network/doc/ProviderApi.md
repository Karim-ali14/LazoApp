# athletix.api.ProviderApi

## Load the API package
```dart
import 'package:athletix/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**providerLogoutGet**](ProviderApi.md#providerlogoutget) | **GET** /provider/logout | provider logout
[**providerProfileShowGet**](ProviderApi.md#providerprofileshowget) | **GET** /provider/profile/show | show profile
[**providerProfileUpdatePost**](ProviderApi.md#providerprofileupdatepost) | **POST** /provider/profile/update | update profile main data


# **providerLogoutGet**
> providerLogoutGet()

provider logout

### Example
```dart
import 'package:athletix/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProviderApi();

try {
    api_instance.providerLogoutGet();
} catch (e) {
    print('Exception when calling ProviderApi->providerLogoutGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **providerProfileShowGet**
> Object providerProfileShowGet()

show profile

### Example
```dart
import 'package:athletix/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProviderApi();

try {
    final result = api_instance.providerProfileShowGet();
    print(result);
} catch (e) {
    print('Exception when calling ProviderApi->providerProfileShowGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Object**](Object.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **providerProfileUpdatePost**
> Object providerProfileUpdatePost(storeNameEn, storeNameAr, storeOwnerName, cityId)

update profile main data

### Example
```dart
import 'package:athletix/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProviderApi();
final storeNameEn = storeNameEn_example; // String | 
final storeNameAr = storeNameAr_example; // String | 
final storeOwnerName = storeOwnerName_example; // String | 
final cityId = 56; // int | 

try {
    final result = api_instance.providerProfileUpdatePost(storeNameEn, storeNameAr, storeOwnerName, cityId);
    print(result);
} catch (e) {
    print('Exception when calling ProviderApi->providerProfileUpdatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storeNameEn** | **String**|  | [optional] 
 **storeNameAr** | **String**|  | [optional] 
 **storeOwnerName** | **String**|  | [optional] 
 **cityId** | **int**|  | [optional] 

### Return type

[**Object**](Object.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

