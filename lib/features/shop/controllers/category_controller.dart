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

  // ================= Data =================
  // Init category repository
  final _categoryRepository = Get.put(CategoryRepository());

  /// List of [CategoryModel]
  ///
  /// Note: [categories.subCategories] list is empty unless
  /// [fetchSubCategories] is called
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;

  /// Indicates if categories are being fetched
  final RxBool categoriesLoading = false.obs;

  /// Indicates if sub-categories are being fetched
  final RxBool subCategoriesLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // ================= Methods =================

  /// Fetches a list of [CategoryModel] and updates [categories]
  ///
  /// Note: [categories.subCategories] list is empty unless
  /// [fetchSubCategories] is called
  Future<void> fetchCategories() async {
    Log.debug("Fetching categories...");
    try {
      categoriesLoading.value = true;

      categories.value = await _categoryRepository.getCategories();

      Log.debug("Got ${categories.length} categories");

      categoriesLoading.value = false;
    } catch (e) {
      categoriesLoading.value = false;

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
  /// in [categories.subCategories] might be empty!
  Future<bool> fetchSubCategories(int index) async {
    try {
      subCategoriesLoading.value = true;

      if (index < 0 || index >= categories.length) {
        Log.error(
            "Invalid index: $index for categories list of length ${categories.length}");
        GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle,
          message: "Invalid category index",
        );
      }

      if (categories[index].subCategories != null) { // null represents non-fetched subcategories
        Log.debug(
            "subcategories in categories[$index] was already fetched once. skipping...");
        return true;
      }

      final categoryId = categories[index].id;
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);

      if (subCategories.isEmpty) {
        Log.warning("No subcategories found for categoryId: $categoryId");
      }

      categories[index].subCategories = subCategories;
      return true;
    } catch (e) {
      GSnackBar.errorSnackBar(
        title: GTexts.errorSnackBarTitle,
        message: e.toString(),
      );
      return false;
    } finally {
      subCategoriesLoading.value = false;
    }
  }
}
