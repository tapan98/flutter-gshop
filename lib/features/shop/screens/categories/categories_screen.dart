import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/controllers/category_controller.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_appbar.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_panel.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_Page.dart';

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
        children: [
          // NavigationRail
          const CategoryPanel(),

          // Body
          Expanded(
            child: Obx(
              () {
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
                    child: Text("No categories available"),
                  ); // Or any other widget
                } else {
                  return CategoryPage(
                    subcategories: categoryController
                        .categories[categoryPanelController.selectedIndex.value]
                        .subcategories,
                    scrollController:
                        categoryPanelController.categoryPageScrollController,
                    showShimmer: categoryController.areSubCategoriesLoading.value,
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
