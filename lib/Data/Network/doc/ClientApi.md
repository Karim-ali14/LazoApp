# athletix.api.ClientApi

## Load the API package
```dart
import 'package:athletix/api.dart';
```

All URIs are relative to *http://}*

Method | HTTP request | Description
------------- | ------------- | -------------
[**showProfile**](ClientApi.md#showprofile) | **GET** /client/profile/show | show profile
[**updateProfile**](ClientApi.md#updateprofile) | **POST** /client/profile/update | update profile


# **showProfile**
> ShowProfile200Response showProfile()

show profile

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

final api_instance = ClientApi();

try {
    final result = api_instance.showProfile();
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->showProfile: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ShowProfile200Response**](ShowProfile200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProfile**
> UpdateProfile200Response updateProfile(cityId, email, image, name, phone)

update profile

update profile

### Example
```dart
import 'package:athletix/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ClientApi();
final cityId = cityId_example; // String | 
final email = email_example; // String | 
final image = image_example; // String | 
final name = name_example; // String | 
final phone = phone_example; // String | need verification before updating this field here

try {
    final result = api_instance.updateProfile(cityId, email, image, name, phone);
    print(result);
} catch (e) {
    print('Exception when calling ClientApi->updateProfile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **String**|  | [optional] 
 **email** | **String**|  | [optional] 
 **image** | **String**|  | [optional] 
 **name** | **String**|  | [optional] 
 **phone** | **String**| need verification before updating this field here | [optional] 

### Return type

[**UpdateProfile200Response**](UpdateProfile200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

