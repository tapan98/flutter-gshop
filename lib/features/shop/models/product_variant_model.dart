import 'package:gshop/util/logger/logger.dart';

class ProductVariantModel {
  final double price;
  final String sku;
  final int stock;
  final Map<String, String> properties;

  /// should be <= 1 and an absolute value
  final double discountPercentage;

  /// The ratio of Height/width of the image
  /// should be 1, otherwise
  /// it might cause scaling issues
  final List<String> images;

  ProductVariantModel({
    required this.price,
    required this.sku,
    required this.stock,
    required this.images,
    required this.properties,
    required this.discountPercentage,
  });

  Set<String> get allPropertyValues {
    Set<String> values = {};
    properties.forEach((key, value) => values.add(value));
    return values;
  }

  static ProductVariantModel empty() {
    return ProductVariantModel(
      price: 0.0,
      sku: "",
      stock: 0,
      images: [],
      properties: {},
      discountPercentage: 1,
    );
  }

  // Factory constructor to create a variant model from a map
  factory ProductVariantModel.fromMap(Map<String, dynamic> data) {
    return ProductVariantModel(
      price: _getPriceValue(data[variantPriceKey]),
      sku: data[variantSkuKey] ?? "",
      stock: _getStockValue(data[variantStockKey]),
      images: List<String>.unmodifiable(_getImages(data[variantImagesKey])),
      properties: Map.unmodifiable(_getProperties(data[variantPropertiesKey])),
      discountPercentage: _getDiscountPercentage(data[discountMultiplierKey]),
    );
  }

  static Map<String, String> _getProperties(dynamic data) {
    Map<String, String> propertiesValue = {};
    if (data == null) {
      Log.warning("product properties is null!");
      return {};
    } else if (data is Map) {
      data.forEach((key, value) => propertiesValue.addAll({
            key: value.toString(),
          }));
    }
    if (propertiesValue.isEmpty) {
      Log.warning("Product properties is empty: $propertiesValue");
    }

    return propertiesValue;
  }

  /// Returns [true] if discounted price > 0 & <= 1
  ///
  /// Otherwise, [false]
  bool get isDiscountApplicable {
    if (discountPercentage > 0 && discountPercentage <= 1) {
      return true;
    } else {
      return false;
    }
  }

  /// Calculates discounted price (if applicable)
  /// and returns the discounted price
  ///
  /// Note: use .toStringAsFixed(x) to display the price with x decimal places
  double get discountedPrice {
    if (!isDiscountApplicable || discountPercentage == 1) {
      return price;
    } else {
      return (price * (1 - discountPercentage));
    }
  }

  static double _getDiscountPercentage(dynamic data) {
    if (data == null) {
      return 0;
    }
    double discountValue;
    if (data is double) {
      return data;
    } else if (data is String) {
      discountValue = double.tryParse(data) ?? 0;
    } else if (data is int) {
      discountValue = data.toDouble();
    } else {
      discountValue = 0;
    }
    if (discountValue > 1) {
      Log.warning("Discount percentage value is more than 1: $discountValue");
    } else if (discountValue < 0) {
      Log.warning("Discount percentage value is negative: $discountValue");
    }
    return discountValue;
  }

  static List<String> _getImages(List<dynamic>? imagesData) {
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

  static int _getStockValue(dynamic stockData) {
    if (stockData is double) {
      return stockData.toInt();
    } else if (stockData is int) {
      return stockData;
    } else if (stockData is String) {
      return int.tryParse(stockData) ?? 0;
    } else {
      Log.warning("Invalid stock data: $stockData");
      return 0;
    }
  }

  static double _getPriceValue(dynamic priceData) {
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
    return 'ProductVariantModel(price: $price, sku: $sku, stock: $stock, properties: $properties)';
  }

  // =============== Constants ===============
  /// A [List] of variants, each item is a [Map]
  static const variantsKey = "Variants";

  // for map under variants array/list
  static const variantPropertiesKey = "Properties";
  static const variantPriceKey = "Price";
  static const variantSkuKey = "Sku";
  static const variantStockKey = "Stock";
  static const variantImagesKey = "Images";
  static const discountMultiplierKey = "DiscountPercentage";
}
