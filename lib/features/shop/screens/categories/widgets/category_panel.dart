import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/custom_shapes/container/circular_image_text.dart';
import 'package:gshop/features/shop/controllers/category_controller.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CategoryPanel extends StatelessWidget {
  const CategoryPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    final controller = CategoryController.instance;

    final panelBackgroundColor = isDark ? GColors.darkerGrey : GColors.grey;
    final selectedItemColor = isDark ? GColors.black : GColors.white;

    return LayoutBuilder(
      builder: (context, constraint) {
        return ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: constraint.maxHeight, maxWidth: 90),
          child: ListView.builder(
            itemCount: controller.categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
              // TODO: set index & navigate to selected category section
              onTap: () => controller.onCategorySelected(index),
              child: Obx(
                () => Container(
                  width: 56,
                  height: 90,
                  padding: EdgeInsets.all(GSizes.sm),
                  decoration: BoxDecoration(
                    // Highlight selected Category
                    color: index == controller.selectedIndex.value ? selectedItemColor : panelBackgroundColor,
                  ),
                  child: CircularImageText(
                    width: 40,
                    height: 40,
                    image: GImages.product1,
                    imageBackgroundColor: Colors.transparent,
                    text: "category $index",
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
