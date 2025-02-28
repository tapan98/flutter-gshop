import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/images/circular_image.dart';
import 'package:gshop/data/repositories/category_repository.dart';
import 'package:gshop/features/shop/controllers/category_controller.dart';
import 'package:gshop/features/shop/models/category_model.dart';
import 'package:gshop/features/shop/models/category_panel_model.dart';
import 'package:gshop/features/shop/models/sub_category_model.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_Page.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in CategoriesScreen
class CategoryPanelController extends GetxController {
  static CategoryPanelController get instance => Get.find();

  // Variables
  final RxInt selectedIndex = 0.obs;
  final categoryPageScrollController = ScrollController();
  final _categoryRepository = CategoryRepository.instance;
  final _categoryController = CategoryController.instance;

  final RxList<CategoryPanelModel> categoryPanelList =
      <CategoryPanelModel>[].obs;
  final RxBool isPanelLoading = false.obs;

  // Methods
  Future<void> fetchCategoryPanels() async {
    try {
      isPanelLoading.value = true;

      final List<CategoryModel> categories =
          _categoryController.categories.isNotEmpty
              ? _categoryController.categories
              : await _categoryRepository.getCategories();

      categoryPanelList.value = categories
          .map(
            (category) => CategoryPanelModel(
              image: category.image,
              title: category.name,
              navigationRailDestination: NavigationRailDestination(
                icon: CircularImage(
                  imageUrl: category.image,
                  isNetworkImage: true,
                ),
                label: Text(category.name),
              ),
              categoryId: category.id,
            ),
          )
          .toList();
      if (categoryPanelList.isNotEmpty) {
        // Load init entry
        _categoryController.fetchSubCategories(selectedIndex.value);
      }
    } catch (e) {
      GSnackBar.errorSnackBar(
        title: GTexts.errorSnackBarTitle,
        message: e.toString(),
      );
    } finally {
      isPanelLoading.value = false;
    }
  }

  Future<void> onCategorySelected(int index) async {
    selectedIndex.value = index;
    _categoryController.fetchSubCategories(index).then((didFetch) {
      if (didFetch && categoryPageScrollController.hasClients) {
        categoryPageScrollController.animateTo(0,
            duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
      }
    });
  }

  @override
  void onInit() {
    fetchCategoryPanels();
    super.onInit();
  }

  @override
  void onClose() {
    Log.debug("Disposing sectionScrollController ...");
    categoryPageScrollController.dispose();
    super.onClose();
  }
}
