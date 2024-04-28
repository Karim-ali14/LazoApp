//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AdminCityApi {
  AdminCityApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// update city
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] cityId:
  ///
  /// * [String] nameEn:
  ///
  /// * [String] nameAr:
  Future<Response> adminCityCreatePostWithHttpInfo({ int? cityId, String? nameEn, String? nameAr, }) async {
    // ignore: prefer_const_declarations
    final path = r'/admin/city/create';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (cityId != null) {
      hasFields = true;
      mp.fields[r'city_id'] = parameterToString(cityId);
    }
    if (nameEn != null) {
      hasFields = true;
      mp.fields[r'name_en'] = parameterToString(nameEn);
    }
    if (nameAr != null) {
      hasFields = true;
      mp.fields[r'name_ar'] = parameterToString(nameAr);
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

  /// update city
  ///
  /// Parameters:
  ///
  /// * [int] cityId:
  ///
  /// * [String] nameEn:
  ///
  /// * [String] nameAr:
  Future<Object?> adminCityCreatePost({ int? cityId, String? nameEn, String? nameAr, }) async {
    final response = await adminCityCreatePostWithHttpInfo( cityId: cityId, nameEn: nameEn, nameAr: nameAr, );
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

  /// delete city
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] cityId:
  Future<Response> adminCityDeleteDeleteWithHttpInfo({ int? cityId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/admin/city/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (cityId != null) {
      queryParams.addAll(_queryParams('', 'city_id', cityId));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// delete city
  ///
  /// Parameters:
  ///
  /// * [int] cityId:
  Future<void> adminCityDeleteDelete({ int? cityId, }) async {
    final response = await adminCityDeleteDeleteWithHttpInfo( cityId: cityId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
