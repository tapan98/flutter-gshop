import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/controllers/category_controller.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_appbar.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_panel.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_page.dart';

import '../../../../util/constants/text_strings.dart';
import '../../controllers/category_panel_controller.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryPanelController = Get.put(CategoryPanelController());
    final categoryController = CategoryController.instance;

    return Scaffold(
      appBar: const CategoryAppbar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NavigationRail
          const CategoryPanel(),

          // Body
          Expanded(
            child: Obx(
              () {
                final bool isSubCategoriesNotNull = categoryController
                    .categories[categoryPanelController.selectedIndex.value]
                    .subCategories != null;
                final bool isSubCategoriesEmpty = categoryController
                    .categories[categoryPanelController.selectedIndex.value]
                    .subCategories
                    ?.isEmpty ?? true;
                if (categoryPanelController.isPanelLoading.value) {
                  return Center(
                    child: CategoryPage(
                      subcategories: [],
                      scrollController:
                          categoryPanelController.categoryPageScrollController,
                      showShimmer: true,
                    ),
                  );
                } else if (categoryPanelController.categoryPanelList.isEmpty) {
                  return const Center(
                    child: Text(GTexts.noSubCategoriesFound),
                  ); // Or any other widget
                } else if (isSubCategoriesNotNull && isSubCategoriesEmpty &&
                    !categoryController.subCategoriesLoading.value) {
                  // No sub categories
                  return const Center(
                    child: Text(GTexts.noSubCategoriesFound),
                  );
                } else {
                  return CategoryPage(
                    subcategories: categoryController
                        .categories[categoryPanelController.selectedIndex.value]
                        .subCategories,
                    scrollController:
                        categoryPanelController.categoryPageScrollController,
                    showShimmer:
                        categoryController.subCategoriesLoading.value,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
