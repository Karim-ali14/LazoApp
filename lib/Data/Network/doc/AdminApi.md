# athletix.api.AdminApi

## Load the API package
```dart
import 'package:athletix/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminProfileShowGet**](AdminApi.md#adminprofileshowget) | **GET** /admin/profile/show | show admin profile


# **adminProfileShowGet**
> Object adminProfileShowGet()

show admin profile

### Example
```dart
import 'package:athletix/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();

try {
    final result = api_instance.adminProfileShowGet();
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->adminProfileShowGet: $e\n');
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

