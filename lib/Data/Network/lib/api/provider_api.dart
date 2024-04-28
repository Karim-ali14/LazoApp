//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ProviderApi {
  ProviderApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// provider logout
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> providerLogoutGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/provider/logout';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// provider logout
  Future<void> providerLogoutGet() async {
    final response = await providerLogoutGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// show profile
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> providerProfileShowGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/provider/profile/show';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// show profile
  Future<Object?> providerProfileShowGet() async {
    final response = await providerProfileShowGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }

  /// update profile main data
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] storeNameEn:
  ///
  /// * [String] storeNameAr:
  ///
  /// * [String] storeOwnerName:
  ///
  /// * [int] cityId:
  Future<Response> providerProfileUpdatePostWithHttpInfo({ String? storeNameEn, String? storeNameAr, String? storeOwnerName, int? cityId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/provider/profile/update';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (storeNameEn != null) {
      hasFields = true;
      mp.fields[r'store_name_en'] = parameterToString(storeNameEn);
    }
    if (storeNameAr != null) {
      hasFields = true;
      mp.fields[r'store_name_ar'] = parameterToString(storeNameAr);
    }
    if (storeOwnerName != null) {
      hasFields = true;
      mp.fields[r'store_owner_name'] = parameterToString(storeOwnerName);
    }
    if (cityId != null) {
      hasFields = true;
      mp.fields[r'city_id'] = parameterToString(cityId);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// update profile main data
  ///
  /// Parameters:
  ///
  /// * [String] storeNameEn:
  ///
  /// * [String] storeNameAr:
  ///
  /// * [String] storeOwnerName:
  ///
  /// * [int] cityId:
  Future<Object?> providerProfileUpdatePost({ String? storeNameEn, String? storeNameAr, String? storeOwnerName, int? cityId, }) async {
    final response = await providerProfileUpdatePostWithHttpInfo( storeNameEn: storeNameEn, storeNameAr: storeNameAr, storeOwnerName: storeOwnerName, cityId: cityId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }
}
