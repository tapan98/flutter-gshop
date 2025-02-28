import 'package:get/get.dart';
import 'package:gshop/data/repositories/category_repository.dart';
import 'package:gshop/features/shop/models/category_model.dart';
import 'package:gshop/features/shop/models/sub_category_model.dart';
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
  final RxBool areCategoriesLoading = false.obs;
  final RxBool areSubCategoriesLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // Methods
  Future<void> fetchCategories() async {
    Log.debug("Fetching categories...");
    try {
      areCategoriesLoading.value = true;

      categories.value = await _categoryRepository.getCategories();

      Log.debug("Got ${categories.length} categories");

      areCategoriesLoading.value = false;
    } catch (e) {
      areCategoriesLoading.value = false;

      GSnackBar.errorSnackBar(
        title: GTexts.errorSnackBarTitle,
        message: e.toString(),
      );
    }
  }

  /// Fetches a list of [SubCategoryModel] and
  /// assigns it to [categories] at [index]
  ///
  /// Returns [true] if there were no errors, else [false]
  ///
  /// Note: Even if it returns [true], the list of [SubCategoryModel]
  /// in [categories.subcategories] might be empty!
  Future<bool> fetchSubCategories(int index) async {
    try {
      areSubCategoriesLoading.value = true;

      if (index < 0 || index >= categories.length) {
        Log.error(
            "Invalid index: $index for categories list of length ${categories.length}");
        GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle,
          message: "Invalid category index",
        );
      }

      final categoryId = categories[index].id;
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);

      if (subCategories.isEmpty) {
        Log.warning("No subcategories found for categoryId: $categoryId");
      }

      categories[index].subcategories = subCategories;
      return true;
    } catch (e) {
      GSnackBar.errorSnackBar(
        title: GTexts.errorSnackBarTitle,
        message: e.toString(),
      );
      return false;
    } finally {
      areSubCategoriesLoading.value = false;
    }
  }
}
