//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProductsListResponseDataLinksInner {
  /// Returns a new [ProductsListResponseDataLinksInner] instance.
  ProductsListResponseDataLinksInner({
    this.active,
    this.label,
    this.url,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? active;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? label;

  String? url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProductsListResponseDataLinksInner &&
     other.active == active &&
     other.label == label &&
     other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (active == null ? 0 : active!.hashCode) +
    (label == null ? 0 : label!.hashCode) +
    (url == null ? 0 : url!.hashCode);

  @override
  String toString() => 'ProductsListResponseDataLinksInner[active=$active, label=$label, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.active != null) {
      json[r'active'] = this.active;
    } else {
      json[r'active'] = null;
    }
    if (this.label != null) {
      json[r'label'] = this.label;
    } else {
      json[r'label'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    return json;
  }

  /// Returns a new [ProductsListResponseDataLinksInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProductsListResponseDataLinksInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProductsListResponseDataLinksInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProductsListResponseDataLinksInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProductsListResponseDataLinksInner(
        active: mapValueOfType<bool>(json, r'active'),
        label: mapValueOfType<String>(json, r'label'),
        url: mapValueOfType<String>(json, r'url'),
      );
    }
    return null;
  }

  static List<ProductsListResponseDataLinksInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProductsListResponseDataLinksInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProductsListResponseDataLinksInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProductsListResponseDataLinksInner> mapFromJson(dynamic json) {
    final map = <String, ProductsListResponseDataLinksInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProductsListResponseDataLinksInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProductsListResponseDataLinksInner-objects as value to a dart map
  static Map<String, List<ProductsListResponseDataLinksInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProductsListResponseDataLinksInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProductsListResponseDataLinksInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

