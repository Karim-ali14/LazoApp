//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/admin_api.dart';
part 'api/admin_city_api.dart';
part 'api/admin_tags_api.dart';
part 'api/provider_api.dart';
part 'api/public_api.dart';
part 'api/public_auth_api.dart';

part 'model/banner.dart';
part 'model/banners_response.dart';
part 'model/categories_response.dart';
part 'model/category.dart';
part 'model/category_menu.dart';
part 'model/cities_response.dart';
part 'model/city.dart';
part 'model/code_confirm_request.dart';
part 'model/code_confirm_response.dart';
part 'model/code_send_request.dart';
part 'model/code_send_response.dart';
part 'model/color.dart';
part 'model/colors_response.dart';
part 'model/extra_item.dart';
part 'model/model_list.dart';
part 'model/occasion.dart';
part 'model/occasions_response.dart';
part 'model/product_show_response.dart';
part 'model/product_show_response_data.dart';
part 'model/products_list_response.dart';
part 'model/products_list_response_data.dart';
part 'model/products_list_response_data_links_inner.dart';
part 'model/promocode_details.dart';
part 'model/provider_category_menu_response.dart';
part 'model/provider_data.dart';
part 'model/provider_data_city.dart';
part 'model/provider_data_locations_inner.dart';
part 'model/provider_data_tags_inner.dart';
part 'model/provider_location.dart';
part 'model/provider_login_response.dart';
part 'model/provider_login_response_data.dart';
part 'model/provider_product.dart';
part 'model/provider_profile_show_response.dart';
part 'model/provider_profile_update_request.dart';
part 'model/provider_profile_update_response.dart';
part 'model/provider_profile_update_response_data.dart';
part 'model/provider_register_request.dart';
part 'model/provider_register_response.dart';
part 'model/provider_register_response_data.dart';
part 'model/reset_code_confirm_request.dart';
part 'model/reset_code_confirm_response.dart';
part 'model/reset_code_send_request.dart';
part 'model/reset_code_send_response.dart';
part 'model/reset_password_request.dart';
part 'model/reset_password_response.dart';
part 'model/size.dart';
part 'model/sizes_response.dart';
part 'model/tag.dart';
part 'model/tags_response.dart';
part 'model/upload_files.dart';


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
