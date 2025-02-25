import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_appbar.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_panel.dart';

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
            child: Obx(() =>
                controller.getDestinations()[controller.selectedIndex.value]),
          ),
        ],
      ),
    );
  }
}
