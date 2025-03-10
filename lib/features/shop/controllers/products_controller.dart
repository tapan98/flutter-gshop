import 'package:get/get.dart';
import 'package:gshop/data/repositories/products_repository.dart';
import 'package:gshop/features/shop/models/product_model.dart';
import 'package:gshop/features/shop/screens/home/home_screen.dart';
import 'package:gshop/features/shop/screens/product_details/product_details_screen.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

import '../models/product_variant_model.dart';

/// Instantiated in [HomeScreen]
///
/// Communicates with [ProductsRepository] to fetch products
class ProductsController extends GetxController {
  static ProductsController get instance => Get.find();

  // ====================== Data ======================
  final _productsRepository = ProductsRepository.instance;

  /// List of popular product ids
  RxList<String> popularProductIds = <String>[].obs;
  RxBool popularProductsLoading = false.obs;

  /// Selected properties for product variant
  ///
  /// Used in [ProductDetailsScreen]
  Rx<Map<String, String>?> selectedProperties = Rx<Map<String, String>?>(null);

  /// Selected product variant
  ///
  /// Used in [ProductDetailsScreen]
  Rx<int?> selectedVariantIndex = Rx<int?>(null);

  /// Currently selected product to be displayed in [ProductDetailsScreen]
  final Rx<ProductModel?> product = Rx<ProductModel?>(null);
  RxBool productLoading = false.obs;

  // In-memory cache
  final Map<String, ProductModel> _productCache = {};

  // ====================== Methods ======================
  /// Fetches popular products from [ProductsRepository]
  ///
  /// Called automatically when the controller is initialized
  Future<void> _fetchPopularProducts() async {
    popularProductsLoading.value = true;

    try {
      final List<String> products =
          await _productsRepository.getPopularProductIds();

      if (products.isEmpty) {
        Log.warning("No popular products found!");
        return;
      }

      Log.debug("Fetched popular products: $products");

      popularProductIds.value = products;
    } catch (e) {
      GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle, message: e.toString());
    } finally {
      popularProductsLoading.value = false;
    }
  }

  Future<ProductModel?> fetchProductById(String productId) async {
    Log.debug("Fetching product by ID: $productId");

    if (productId.isEmpty) {
      Log.warning("Product id is empty: $productId");
      return null;
    }

    if (_productCache.containsKey(productId)) {
      return _productCache[productId];
    }

    try {
      final ProductModel? product =
          await _productsRepository.getProductById(productId);

      // Add product to cache
      if (product != null) {
        _productCache[productId] = product;
      }

      return product;
    } catch (e) {
      GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle, message: e.toString());
      return null;
    }
  }

  /// Updates the value of [selectedVariantIndex] based on the values of [selectedProperties]
  void updateProductVariant() {
    if (product.value == null) {
      Log.error("product value is null");
      return;
    } else if (selectedProperties.value == null) {
      Log.error("selectedProperties value is null");
      return;
    } else if (selectedProperties.value!.isEmpty) {
      Log.warning(
          "Selected properties is empty! trying to assign a variant properties value...");
      selectedProperties.value = product.value!.variants.first.properties;
    }

    for (int i = 0; i < product.value!.variants.length; i++) {
      ProductVariantModel variant = product.value!.variants[i];
      if (variant.allPropertyValues
          .containsAll(selectedProperties.value!.values)) {
        selectedVariantIndex.value = i;
        return;
      }
    }

    if (selectedVariantIndex.value == null) {
      Log.warning("productVariant index is null");
    }
  }

  Set<String> get allVariantsPropertyKeys {
    if (product.value == null) {
      return {};
    }
    return product.value!.getAllVariantsPropertyKeys();
  }

  /// Looks into all the variants of the product
  /// and returns all the values of the given [propertyKey]
  Set<String> getAllVariantsPropertyValues(String propertyKey) {
    if (product.value == null) {
      return {};
    }
    return product.value!.getAllVariantsPropertyValues(propertyKey);
  }

  /// Calls [fetchProductById] to set the value of [product]
  ///
  /// Tries to set [productVariant] as the first variant of [product]
  ///
  /// Also updates [selectedProperties] using the property values of [productVariant]
  Future<void> selectProductById(String productId) async {
    productLoading.value = true;
    product.value = await fetchProductById(productId);

    if (product.value == null) {
      return;
    }

    if (product.value!.variants.isEmpty) {
      Log.warning("product: ${product.value?.id} has no variants");
    } else {
      selectedVariantIndex.value = 0;

      // create a deep copy of the first variant's properties
      selectedProperties.value = {...product.value!.variants.first.properties};

      // selectedProperties(productVariant.value!.properties);
    }

    productLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    _fetchPopularProducts();
  }
}
