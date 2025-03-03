import 'package:get/get.dart';
import 'package:gshop/data/repositories/products_repository.dart';
import 'package:gshop/features/shop/models/product_model.dart';
import 'package:gshop/features/shop/screens/home/home_screen.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in [HomeScreen]
///
/// Communicates with [ProductsRepository] to fetch products
class ProductsController extends GetxController {
  static ProductsController get instance => Get.find();

  // ====================== Data ======================
  final _productsRepository = ProductsRepository.instance;

  RxList<String> popularProductIds = <String>[].obs;
  RxBool popularProductsLoading = false.obs;

  // In-memory cache
  final Map<String, ProductModel> _productCache = {};

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

    if (_productCache.containsKey(productId)) {
      Log.info("Product found in cache: $productId");
      return _productCache[productId];
    }

    Log.info("Product not found in cache, fetching from network: $productId");
    try {

      final product = await _productsRepository.getProductById(productId);

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

  @override
  void onInit() {
    super.onInit();
    _fetchPopularProducts();
  }
}
