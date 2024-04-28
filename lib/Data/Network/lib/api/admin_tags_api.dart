//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AdminTagsApi {
  AdminTagsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// create a tag
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] nameEn:
  ///
  /// * [String] nameAr:
  Future<Response> adminTagCreatePostWithHttpInfo({ String? nameEn, String? nameAr, }) async {
    // ignore: prefer_const_declarations
    final path = r'/admin/tag/create';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
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

  /// create a tag
  ///
  /// Parameters:
  ///
  /// * [String] nameEn:
  ///
  /// * [String] nameAr:
  Future<Object?> adminTagCreatePost({ String? nameEn, String? nameAr, }) async {
    final response = await adminTagCreatePostWithHttpInfo( nameEn: nameEn, nameAr: nameAr, );
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

  /// delete a tag
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] tagId:
  Future<Response> adminTagDeleteDeleteWithHttpInfo({ int? tagId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/admin/tag/delete';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (tagId != null) {
      queryParams.addAll(_queryParams('', 'tag_id', tagId));
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

  /// delete a tag
  ///
  /// Parameters:
  ///
  /// * [int] tagId:
  Future<void> adminTagDeleteDelete({ int? tagId, }) async {
    final response = await adminTagDeleteDeleteWithHttpInfo( tagId: tagId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// update a tag
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] tagId:
  ///
  /// * [String] nameEn:
  ///
  /// * [String] nameAr:
  Future<Response> adminTagUpdatePostWithHttpInfo({ int? tagId, String? nameEn, String? nameAr, }) async {
    // ignore: prefer_const_declarations
    final path = r'/admin/tag/update';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (tagId != null) {
      hasFields = true;
      mp.fields[r'tag_id'] = parameterToString(tagId);
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

  /// update a tag
  ///
  /// Parameters:
  ///
  /// * [int] tagId:
  ///
  /// * [String] nameEn:
  ///
  /// * [String] nameAr:
  Future<Object?> adminTagUpdatePost({ int? tagId, String? nameEn, String? nameAr, }) async {
    final response = await adminTagUpdatePostWithHttpInfo( tagId: tagId, nameEn: nameEn, nameAr: nameAr, );
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
