import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_panel.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import '../../controllers/category_controller.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(CategoryController());

    return Scaffold(

      appBar: GAppBar(
        showBackArrow: false,
        title: Text("All Categories"),
        actions: [
          // Search Button
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: GSizes.iconMd,
                  color: isDark ? GColors.white : GColors.black,
                ),
                const SizedBox(width: GSizes.spaceBtwItems / 2),
                Text("Search", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          // NavigationRail
          CategoryPanel(),

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
