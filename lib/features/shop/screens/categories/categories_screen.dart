import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_appbar.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_panel.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_section.dart';

import '../../controllers/category_panel_controller.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryPanelController());

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
                if (controller.isLoading.value) {
                  return Center(
                    child: CategorySection(
                      sectionTitle: "",
                      scrollController: controller.sectionScrollController,
                      showShimmer: true,
                    ),
                  );
                } else if (controller.categoryPanelList.isEmpty) {
                  return const Center(
                    child: Text("No categories available"),
                  ); // Or any other widget
                } else {
                  return controller
                      .categoryPanelList[controller.selectedIndex.value]
                      .destination;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
