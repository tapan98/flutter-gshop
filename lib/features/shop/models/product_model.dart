import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gshop/features/shop/models/product_variant_model.dart';
import 'package:gshop/util/logger/logger.dart';

class ProductModel {
  final String brandId;
  final String title;
  final List<ProductVariantModel> variants;
  final String? offerText;
  final Map<String, int>? ratings;

  ProductModel({
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
  List<String> getVariantPropertyKeys() {
    if (variants.isEmpty) {
      return [];
    }

    Set<String> propertyKeys = {};

    for (var variant in variants) {
      propertyKeys.addAll(variant.properties.keys);
    }

    return propertyKeys.toList();
  }

  /// Returns a list of all possible property value of [propertyKey] from all variants.
  List<String> getVariantPropertyValues(String propertyKey) {
    if (variants.isEmpty) {
      return [];
    }
    Set<String> propertyValues = {};
    for (var variant in variants) {
      if (variant.properties[propertyKey] != null) {
        propertyValues.add(variant.properties[propertyKey]!);
      }
    }
    return propertyValues.toList();
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

    return ProductModel(
      brandId: data[brandIdKey] ?? "",
      title: data[titleKey] ?? "",
      variants: (data[variantsKey] as List<dynamic>)
          .map((e) => ProductVariantModel.fromMap(e))
          .toList(),
      offerText: data[offerTextKey],
      ratings: _getRatings(data[ratingsKey]),
    );
  }

  static Map<String, int>? _getRatings(dynamic data) {
    Log.debug("Parsing ratings from data: $data");
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

    Log.debug("Final parsed ratings: $ratings");
    return ratings;
  }

  static ProductModel empty() => ProductModel(
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
