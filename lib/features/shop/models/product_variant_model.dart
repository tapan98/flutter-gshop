
import 'package:gshop/util/logger/logger.dart';

class ProductVariantModel {
  final String color;
  final double price;
  final String size;
  final String sku;
  final int stock;
  /// The ratio of Height/width of the image
  /// should be 1, otherwise
  /// it might cause scaling issues
  final List<String> images;

  ProductVariantModel({
    required this.color,
    required this.price,
    required this.size,
    required this.sku,
    required this.stock,
    required this.images,
  });

  // Factory constructor to create a variant model from a map
  factory ProductVariantModel.fromMap(Map<String, dynamic> data) {
    return ProductVariantModel(
      color: data[variantColorKey] ?? '',
      price: getPriceValue(data[variantPriceKey]),
      size: data[variantSizeKey] ?? "",
      sku: data[variantSkuKey] ?? "",
      stock: getStockValue(data[variantStockKey]),
      images: getImages(data[variantImagesKey]),
    );

  }

  static List<String> getImages(List<dynamic>? imagesData) {
    if (imagesData == null) {
      return [];
    }
    List<String> images = [];
    for (var image in imagesData) {
      if (image != null && image is String) {
        images.add(image.toString());
      } else {
        Log.warning("Invalid image data: $image");
      }
    }
    return images;
  }

  static int getStockValue(dynamic stockData) {
    if (stockData is double) {
      return stockData.toInt();
    } else if (stockData is int) {
      return stockData;
    } else {
      Log.warning("Invalid stock data: $stockData");
      return 0;
    }
  }

  static double getPriceValue(dynamic priceData) {
    if (priceData is double) {
      return priceData;
    } else if (priceData is int) {
      return priceData.toDouble();
    } else {
      Log.warning("Invalid price data: $priceData");
      return 0.0;
    }
  }

  @override
  String toString() {
    return 'ProductVariantModel(color: $color, price: $price, size: $size, sku: $sku, stock: $stock, images: $images)';
  }

  // =============== Constants ===============
  /// A [List] of variants, each item is a [Map]
  static const variantsKey = "Variants";

  // for map under variants array/list
  static const variantColorKey = "Color";
  static const variantPriceKey = "Price";
  static const variantSizeKey = "Size";
  static const variantSkuKey = "Sku";
  static const variantStockKey = "Stock";
  static const variantImagesKey = "Images";
}
