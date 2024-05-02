//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProductShowResponseData {
  /// Returns a new [ProductShowResponseData] instance.
  ProductShowResponseData({
    this.amount,
    this.categories = const [],
    this.categoryMenu = const [],
    this.colors = const [],
    this.createdAt,
    this.description,
    this.descriptionAr,
    this.descriptionEn,
    this.expectedProcessingTime,
    this.extraItems = const [],
    this.id,
    this.lists = const [],
    this.name,
    this.nameAr,
    this.nameEn,
    this.occasions = const [],
    this.price,
    this.priceAfterDiscount,
    this.providerId,
    this.sizes = const [],
    this.type,
    this.updatedAt,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? amount;

  List<Category> categories;

  List<CategoryMenu> categoryMenu;

  List<Color> colors;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? createdAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? descriptionAr;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? descriptionEn;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expectedProcessingTime;

  List<ExtraItem> extraItems;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? id;

  List<ListItems> lists;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nameAr;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nameEn;

  List<Occasion> occasions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? price;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? priceAfterDiscount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? providerId;

  List<Size> sizes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProductShowResponseData &&
     other.amount == amount &&
     other.categories == categories &&
     other.categoryMenu == categoryMenu &&
     other.colors == colors &&
     other.createdAt == createdAt &&
     other.description == description &&
     other.descriptionAr == descriptionAr &&
     other.descriptionEn == descriptionEn &&
     other.expectedProcessingTime == expectedProcessingTime &&
     other.extraItems == extraItems &&
     other.id == id &&
     other.lists == lists &&
     other.name == name &&
     other.nameAr == nameAr &&
     other.nameEn == nameEn &&
     other.occasions == occasions &&
     other.price == price &&
     other.priceAfterDiscount == priceAfterDiscount &&
     other.providerId == providerId &&
     other.sizes == sizes &&
     other.type == type &&
     other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (amount == null ? 0 : amount!.hashCode) +
    (categories.hashCode) +
    (categoryMenu.hashCode) +
    (colors.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (descriptionAr == null ? 0 : descriptionAr!.hashCode) +
    (descriptionEn == null ? 0 : descriptionEn!.hashCode) +
    (expectedProcessingTime == null ? 0 : expectedProcessingTime!.hashCode) +
    (extraItems.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (lists.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (nameAr == null ? 0 : nameAr!.hashCode) +
    (nameEn == null ? 0 : nameEn!.hashCode) +
    (occasions.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (priceAfterDiscount == null ? 0 : priceAfterDiscount!.hashCode) +
    (providerId == null ? 0 : providerId!.hashCode) +
    (sizes.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode);

  @override
  String toString() => 'ProductShowResponseData[amount=$amount, categories=$categories, categoryMenu=$categoryMenu, colors=$colors, createdAt=$createdAt, description=$description, descriptionAr=$descriptionAr, descriptionEn=$descriptionEn, expectedProcessingTime=$expectedProcessingTime, extraItems=$extraItems, id=$id, lists=$lists, name=$name, nameAr=$nameAr, nameEn=$nameEn, occasions=$occasions, price=$price, priceAfterDiscount=$priceAfterDiscount, providerId=$providerId, sizes=$sizes, type=$type, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.amount != null) {
      json[r'amount'] = this.amount;
    } else {
      json[r'amount'] = null;
    }
      json[r'categories'] = this.categories;
      json[r'category_menu'] = this.categoryMenu;
      json[r'colors'] = this.colors;
    if (this.createdAt != null) {
      json[r'created_at'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'created_at'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.descriptionAr != null) {
      json[r'description_ar'] = this.descriptionAr;
    } else {
      json[r'description_ar'] = null;
    }
    if (this.descriptionEn != null) {
      json[r'description_en'] = this.descriptionEn;
    } else {
      json[r'description_en'] = null;
    }
    if (this.expectedProcessingTime != null) {
      json[r'expected_processing_time'] = this.expectedProcessingTime;
    } else {
      json[r'expected_processing_time'] = null;
    }
      json[r'extra_items'] = this.extraItems;
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'lists'] = this.lists;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.nameAr != null) {
      json[r'name_ar'] = this.nameAr;
    } else {
      json[r'name_ar'] = null;
    }
    if (this.nameEn != null) {
      json[r'name_en'] = this.nameEn;
    } else {
      json[r'name_en'] = null;
    }
      json[r'occasions'] = this.occasions;
    if (this.price != null) {
      json[r'price'] = this.price;
    } else {
      json[r'price'] = null;
    }
    if (this.priceAfterDiscount != null) {
      json[r'price_after_discount'] = this.priceAfterDiscount;
    } else {
      json[r'price_after_discount'] = null;
    }
    if (this.providerId != null) {
      json[r'provider_id'] = this.providerId;
    } else {
      json[r'provider_id'] = null;
    }
      json[r'sizes'] = this.sizes;
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updated_at'] = this.updatedAt!.toUtc().toIso8601String();
    } else {
      json[r'updated_at'] = null;
    }
    return json;
  }

  /// Returns a new [ProductShowResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProductShowResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ProductShowResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ProductShowResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProductShowResponseData(
        amount: json[r'amount'] == null
            ? null
            : num.parse(json[r'amount'].toString()),
        categories: Category.listFromJson(json[r'categories']),
        categoryMenu: CategoryMenu.listFromJson(json[r'category_menu']),
        colors: Color.listFromJson(json[r'colors']),
        createdAt: mapDateTime(json, r'created_at', ''),
        description: mapValueOfType<String>(json, r'description'),
        descriptionAr: mapValueOfType<String>(json, r'description_ar'),
        descriptionEn: mapValueOfType<String>(json, r'description_en'),
        expectedProcessingTime: mapValueOfType<String>(json, r'expected_processing_time'),
        extraItems: ExtraItem.listFromJson(json[r'extra_items']),
        id: json[r'id'] == null
            ? null
            : num.parse(json[r'id'].toString()),
        lists: ListItems.listFromJson(json[r'lists']),
        name: mapValueOfType<String>(json, r'name'),
        nameAr: mapValueOfType<String>(json, r'name_ar'),
        nameEn: mapValueOfType<String>(json, r'name_en'),
        occasions: Occasion.listFromJson(json[r'occasions']),
        price: json[r'price'] == null
            ? null
            : num.parse(json[r'price'].toString()),
        priceAfterDiscount: json[r'price_after_discount'] == null
            ? null
            : num.parse(json[r'price_after_discount'].toString()),
        providerId: json[r'provider_id'] == null
            ? null
            : num.parse(json[r'provider_id'].toString()),
        sizes: Size.listFromJson(json[r'sizes']),
        type: mapValueOfType<String>(json, r'type'),
        updatedAt: mapDateTime(json, r'updated_at', ''),
      );
    }
    return null;
  }

  static List<ProductShowResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProductShowResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProductShowResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProductShowResponseData> mapFromJson(dynamic json) {
    final map = <String, ProductShowResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProductShowResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProductShowResponseData-objects as value to a dart map
  static Map<String, List<ProductShowResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProductShowResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProductShowResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

