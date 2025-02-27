import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/controllers/category_panel_controller.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_panel_item.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/helpers/helper_functions.dart';
import 'package:gshop/util/logger/logger.dart';

class CategoryPanel extends StatefulWidget {
  const CategoryPanel({super.key});

  @override
  State<CategoryPanel> createState() => _CategoryPanelState();
}

class _CategoryPanelState extends State<CategoryPanel> {
  final controller = CategoryPanelController.instance;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    final panelBackgroundColor = isDark ? GColors.darkerGrey : GColors.grey;
    final selectedItemColor = Colors.transparent;
    final int shimmerCount = 5;

    return LayoutBuilder(
      builder: (context, constraint) {
        return ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: constraint.maxHeight, maxWidth: 90),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.isLoading.value
                  ? shimmerCount
                  : controller.categoryPanelList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final Color backgroundColor =
                    (controller.selectedIndex.value == index)
                        ? selectedItemColor
                        : panelBackgroundColor;
                Log.debug(
                    "itemBuilder: index: $index, color: $backgroundColor");
                return CategoryPanelItem(
                  key: ValueKey(index),
                  imageUrl: controller.isLoading.value ? "" : controller.categoryPanelList[index].image,
                  title: controller.isLoading.value ? "" : controller.categoryPanelList[index].title,
                  isNetworkImage: true,
                  backgroundColor: backgroundColor,
                  showShimmer: controller.isLoading.value,
                  onTap: () => setState(() {
                    controller.onCategorySelected(index);
                  }),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
