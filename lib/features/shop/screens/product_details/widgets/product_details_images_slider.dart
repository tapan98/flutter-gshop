import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/custom_shapes/clip_path_shapes/curved_bottom_widget.dart';
import 'package:gshop/features/shop/controllers/product_details_controller.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class ProductDetailsImagesSlider extends StatelessWidget {
  const ProductDetailsImagesSlider({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsController());
    return Column(
      children: [
        Container(
          color: Colors.grey,
          child: Column(
            children: [
              // Images slider
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, _) => controller.updateCurrentIndex(index),
                ),
                items: images
                    .map(
                      (url) => Image(
                        image: AssetImage(url),
                      ),
                    )
                    .toList(),
              ),

              HelperFunctions.spaceBtwItemsHeight(),

              // Slider Dots
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < images.length; i++)
                      Container(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: controller.imageIndex.value == i
                              ? GColors.primary
                              : GColors.grey,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),

        CurvedBottomWidget(
          child: Container(
            color: Colors.grey,
            height: 20,
          ),
        )
      ],
    );
  }
}
