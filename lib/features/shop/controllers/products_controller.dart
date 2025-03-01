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

  // TODO: For testing purpose, remove later
  Rx<ProductModel> product = ProductModel.empty().obs;
  RxBool isProductLoading = false.obs;

  // TODO: For testing purpose, remove or modify later
  Future<void> fetchProduct() async {
    isProductLoading.value = true;
    try {
      final ProductModel? fetchedProduct =
          await _productsRepository.getProductById("AMrFRfuIcjYbFJGlx4Wm");
      Log.debug("================= Final product =================");
      Log.debug("fetched product: $fetchedProduct");
      Log.debug("=================================================");

      Log.debug("Assigning the fetched product...");
      if (fetchedProduct == null) {
        Log.error("fetchedProduct is null!");
      } else {
        product.value = fetchedProduct;
        Log.debug("product.value is now: ${product.value}");
      }
    } catch (e) {
      GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle, message: e.toString());
    } finally {
      isProductLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();

    // TODO: For testing purpose, remove later
    fetchProduct();
  }
}
