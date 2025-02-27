import 'package:get/get.dart';
import 'package:gshop/data/repositories/category_repository.dart';
import 'package:gshop/features/shop/models/category_model.dart';
import 'package:gshop/features/shop/screens/home/widgets/home_product_categories.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in [HomeProductCategories]
///
/// Communicates with [CategoryRepository]
/// to fetch available categories
class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  // Data
  // Init category repository
  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // Methods
  Future<void> fetchCategories() async {
    Log.debug("Fetching categories...");
    try {
      isLoading.value = true;

      categories.value = await _categoryRepository.getCategories();

      Log.debug("Got ${categories.length} categories");

      isLoading.value = false;

    } catch (e) {
      isLoading.value = false;

      GSnackBar.errorSnackBar(
        title: GTexts.errorSnackBarTitle,
        message: e.toString(),
      );
    }
  }
}
