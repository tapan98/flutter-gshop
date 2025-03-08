import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/images/rounded_corner_image.dart';
import 'package:gshop/features/shop/controllers/home_controller.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    RxInt carouselCurrentIndex = 0.obs;
    return Column(
      children: [
        // Slider Images
        Obx(
          () => CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              onPageChanged: (index, _) =>
                  carouselCurrentIndex.value = index,
              viewportFraction: 1,
              aspectRatio: 1.9,

            ),
            items: controller.promos
                .map(
                  (promos) => RoundedCornerImage(
                    imageUrl: promos.image,
                    isNetworkImage: true,
                    padding: const EdgeInsets.all(GSizes.sm),
                  ),
                )
                .toList(),
          ),
        ),

        HelperFunctions.spaceBtwItemsHeight(),

        // Slider Dots
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < controller.promos.length; i++)
                Container(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: carouselCurrentIndex.value == i
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
