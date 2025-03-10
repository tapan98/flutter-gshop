import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gshop/features/shop/models/product_variant_model.dart';
import 'package:gshop/util/logger/logger.dart';

class ProductModel {
  final String id;
  final String brandId;
  final String title;
  final List<ProductVariantModel> variants;
  final String? offerText;
  final Map<String, int>? ratings;

  ProductModel({
    required this.id,
    required this.brandId,
    required this.title,
    required this.variants,
    this.offerText,
    this.ratings,
  });

  // Get first image
  /// Returns the first image of the first variant of the product.
  ///
  /// Returns empty string if no images are available.
  String get firstImage {
    if (variants.isNotEmpty) {
      final images = variants.first.images;
      return images.isNotEmpty ? images.first : '';
    }
    return '';
  }

  /// Returns a list of product variant property types from all variants.
  Set<String> getAllVariantsPropertyKeys() {
    if (variants.isEmpty) {
      return <String>{};
    }

    return variants.expand((variant) => variant.properties.keys).toSet();
  }

  /// Returns a list of all possible property value of [propertyKey] from all variants.
  Set<String> getAllVariantsPropertyValues(String propertyKey) {
    if (variants.isEmpty) {
      return <String>{};
    }

    return variants
        .map((variant) => variant.properties[propertyKey]) // property values
        .where((value) => value != null) // remove null values
        .map((value) => value.toString())
        .toSet();
  }

  /// Looks through each [variants] and matches if all of [propertyValues]
  /// exists in the values field of [properties] of [ProductVariantModel]
  ProductVariantModel? getProductVariantByPropertyValues(
      Set<String> propertyValues) {
    if (variants.isEmpty) {
      return null;
    }

    for (final ProductVariantModel variant in variants) {
      if (variant.allPropertyValues.containsAll(propertyValues)) {
        return variant;
      }
    }

    return null;
  }

  int? get totalRatings {
    if (ratings == null || ratings!.isEmpty) {
      return null;
    }
    return ratings!.values.reduce((value, element) => value + element);
  }

  double? get averageRating {
    if (ratings == null || ratings!.isEmpty) {
      return null;
    }
    int totalRatings = 0;
    int totalStars = 0;
    ratings!.forEach((key, value) {
      totalRatings += value;
      totalStars += int.parse(key) * value;
    });
    return totalStars / totalRatings;
  }

  // Method to get data from firestore document snapshot
  factory ProductModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return ProductModel.empty();
    }

    final data = document.data()!;

    final Map<String, int>? ratings = _getRatings(data[ratingsKey]);

    final product = ProductModel(
      id: document.id,
      brandId: data[brandIdKey] ?? "",
      title: data[titleKey] ?? "",
      variants: List<ProductVariantModel>.unmodifiable(
          (data[variantsKey] as List<dynamic>)
              .map((e) => ProductVariantModel.fromMap(e))
              .toList()),
      offerText: data[offerTextKey],
      ratings: ratings != null ? Map<String, int>.unmodifiable(ratings) : null,
    );

    Log.debug("ProductModel created from Firestore: $product");
    for (final variant in product.variants) {
      Log.debug("Variant properties: ${variant.properties}");
    }

    return product;
  }

  static Map<String, int>? _getRatings(dynamic data) {
    if (data == null || data is! Map) {
      return null;
    }

    final ratings = <String, int>{};
    data.forEach((key, value) {
      if (!validRatingKeys.contains(key)) {
        return;
      }
      int ratingValue;
      if (value is int) {
        ratingValue = value;
      } else if (value is double) {
        ratingValue = value.toInt();
      } else if (value is String) {
        ratingValue = int.tryParse(value) ?? 0;
      } else {
        return;
      }

      ratings[key] = ratingValue;
    });

    return ratings;
  }

  static ProductModel empty() => ProductModel(
        id: '',
        brandId: '',
        title: '',
        variants: [],
        ratings: {},
      );

  @override
  String toString() {
    return 'ProductModel(brandId: $brandId, title: $title, variants: $variants)';
  }

  // =============== Constants ===============
  static const brandIdKey = "BrandId";
  static const titleKey = "Title";
  static const variantsKey = "Variants";
  static const offerTextKey = "OfferText";
  static const ratingsKey = "Ratings";
  static const validRatingKeys = ["1", "2", "3", "4", "5"];
}
