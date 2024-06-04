# athletix.api.CartApi

## Load the API package
```dart
import 'package:athletix/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**showCartDetails**](CartApi.md#showcartdetails) | **GET** /client/cart/show | show cart details


# **showCartDetails**
> ShowCartDetails200Response showCartDetails()

show cart details

show cart details

### Example
```dart
import 'package:athletix/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CartApi();

try {
    final result = api_instance.showCartDetails();
    print(result);
} catch (e) {
    print('Exception when calling CartApi->showCartDetails: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ShowCartDetails200Response**](ShowCartDetails200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

