//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CodeSendResponse {
  /// Returns a new [CodeSendResponse] instance.
  CodeSendResponse({
    this.status,
    this.message,
    this.isExist,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isExist;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CodeSendResponse &&
     other.status == status &&
     other.message == message &&
     other.isExist == isExist;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (status == null ? 0 : status!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (isExist == null ? 0 : isExist!.hashCode);

  @override
  String toString() => 'CodeSendResponse[status=$status, message=$message, isExist=$isExist]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.isExist != null) {
      json[r'is_exist'] = this.isExist;
    } else {
      json[r'is_exist'] = null;
    }
    return json;
  }

  /// Returns a new [CodeSendResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CodeSendResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CodeSendResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CodeSendResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CodeSendResponse(
        status: mapValueOfType<bool>(json, r'status'),
        message: mapValueOfType<String>(json, r'message'),
        isExist: mapValueOfType<bool>(json, r'is_exist'),
      );
    }
    return null;
  }

  static List<CodeSendResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CodeSendResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CodeSendResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CodeSendResponse> mapFromJson(dynamic json) {
    final map = <String, CodeSendResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CodeSendResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CodeSendResponse-objects as value to a dart map
  static Map<String, List<CodeSendResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CodeSendResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CodeSendResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

