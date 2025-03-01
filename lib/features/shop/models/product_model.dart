import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gshop/features/shop/models/product_variant_model.dart';

class ProductModel {
  final String brandId;
  final String title;
  final List<ProductVariantModel> variants;

  ProductModel({
    required this.brandId,
    required this.title,
    required this.variants,
  });

  // Get first image
  String get firstImage {
    if (variants.isNotEmpty) {
      final images = variants.first.images;
      return images.isNotEmpty ? images.first : '';
    }
    return '';
  }

  // Method to get data from firestore document snapshot
  factory ProductModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return ProductModel.empty();
    }

    final data = document.data()!;

    return ProductModel(
      brandId: data[brandIdKey],
      title: data[titleKey],
      variants: (data[variantsKey] as List<dynamic>)
          .map((e) => ProductVariantModel.fromMap(e))
          .toList(),
    );
  }


  static ProductModel empty() => ProductModel(
    brandId: '',
    title: '',
    variants: [],
  );

  @override
  String toString() {
    return 'ProductModel(brandId: $brandId, title: $title, variants: $variants)';
  }

  // =============== Constants ===============
  static const brandIdKey = "BrandId";
  static const titleKey = "Title";
  static const variantsKey = "Variants";
}
