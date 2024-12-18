//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Showtransactions200ResponseDataInner {
  /// Returns a new [Showtransactions200ResponseDataInner] instance.
  Showtransactions200ResponseDataInner({
    this.currentBalance,
    this.transactions,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? currentBalance;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Showtransactions200ResponseDataInnerTransactions? transactions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Showtransactions200ResponseDataInner &&
     other.currentBalance == currentBalance &&
     other.transactions == transactions;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (currentBalance == null ? 0 : currentBalance!.hashCode) +
    (transactions == null ? 0 : transactions!.hashCode);

  @override
  String toString() => 'Showtransactions200ResponseDataInner[currentBalance=$currentBalance, transactions=$transactions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.currentBalance != null) {
      json[r'current_balance'] = this.currentBalance;
    } else {
      json[r'current_balance'] = null;
    }
    if (this.transactions != null) {
      json[r'transactions'] = this.transactions;
    } else {
      json[r'transactions'] = null;
    }
    return json;
  }

  /// Returns a new [Showtransactions200ResponseDataInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Showtransactions200ResponseDataInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Showtransactions200ResponseDataInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Showtransactions200ResponseDataInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Showtransactions200ResponseDataInner(
        currentBalance: mapValueOfType<String>(json, r'current_balance'),
        transactions: Showtransactions200ResponseDataInnerTransactions.fromJson(json[r'transactions']),
      );
    }
    return null;
  }

  static List<Showtransactions200ResponseDataInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Showtransactions200ResponseDataInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Showtransactions200ResponseDataInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Showtransactions200ResponseDataInner> mapFromJson(dynamic json) {
    final map = <String, Showtransactions200ResponseDataInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Showtransactions200ResponseDataInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Showtransactions200ResponseDataInner-objects as value to a dart map
  static Map<String, List<Showtransactions200ResponseDataInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Showtransactions200ResponseDataInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Showtransactions200ResponseDataInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

