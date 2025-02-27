import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/images/circular_image.dart';
import 'package:gshop/data/repositories/category_repository.dart';
import 'package:gshop/features/shop/models/category_panel_model.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_section.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in CategoriesScreen
class CategoryPanelController extends GetxController {
  static CategoryPanelController get instance => Get.find();

  // Variables
  final RxInt selectedIndex = 0.obs;
  final sectionScrollController = ScrollController();
  final _categoryRepository = CategoryRepository.instance;

  final RxList<CategoryPanelModel> categoryPanelList =
      <CategoryPanelModel>[].obs;
  final RxBool isLoading = false.obs;

  // Methods
  Future<void> fetchCategoryPanels() async {
    try {
      isLoading.value = true;
      final categories = await _categoryRepository.getCategories();
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
              destination: CategorySection(
                sectionTitle: '${category.name} Trending now',
                scrollController: sectionScrollController,
              ),
            ),
          )
          .toList();
    } catch (e) {
      GSnackBar.errorSnackBar(
        title: GTexts.errorSnackBarTitle,
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void onCategorySelected(int index) {
    selectedIndex.value = index;
    if (sectionScrollController.hasClients) {
      sectionScrollController.animateTo(0,
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    }
  }

  @override
  void onInit() {
    fetchCategoryPanels();
    super.onInit();
  }

  @override
  void onClose() {
    Log.debug("Disposing sectionScrollController ...");
    sectionScrollController.dispose();
    super.onClose();
  }
}
