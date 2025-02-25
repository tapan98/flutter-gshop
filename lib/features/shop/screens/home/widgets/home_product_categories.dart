import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/styles/padding_styles.dart';
import 'package:gshop/common/widgets/images/vertical_image_text.dart';
import 'package:gshop/features/shop/controllers/category_controller.dart';

class HomeProductCategories extends StatelessWidget {
  const HomeProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return SizedBox(
      height: 100,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.categories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => Padding(
            padding: PaddingStyles.horizontalListPadding(
              length: controller.categories.length,
              index: index,
            ),
            child: VerticalImageText(
              imageUrl: controller.categories[index].image,
              text: controller.categories[index].name,
              isNetworkImage: true,
            ),
          ),
        ),
      ),
    );
  }
}
