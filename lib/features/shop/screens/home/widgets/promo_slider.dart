import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/images/rounded_corner_image.dart';
import 'package:gshop/features/shop/controllers/home_controller.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        // Slider Images
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 10),
            onPageChanged: (index, _) =>
                controller.updateCarouselCurrentIndex(index),
            viewportFraction: 1,
            aspectRatio: 1.9,
          ),
          items: banners
              .map((url) => RoundedCornerImage(
                    imageUrl: url,
                    padding: EdgeInsets.all(GSizes.sm),
                  ))
              .toList(),
        ),

        HelperFunctions.spaceBtwItemsHeight(),

        // Slider Dots
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                Container(
                  width: 20,
                  height: 4,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: controller.carouselCurrentIndex.value == i
                  ? GColors.primary
                    : Colors.grey,
                  ),

                )
            ],
          ),
        )
      ],
    );
  }
}
