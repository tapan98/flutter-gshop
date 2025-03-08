import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/custom_shapes/clip_path_shapes/curved_bottom_widget.dart';
import 'package:gshop/features/shop/controllers/products_controller.dart';
import 'package:gshop/features/shop/models/product_model.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class ProductDetailsImagesSlider extends StatelessWidget {
  const ProductDetailsImagesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductsController.instance;
    final Rx<ProductModel?> product = controller.product;
    final Color backgroundColor = Colors.white;
    RxInt imageIndex = 0.obs;
    return Column(
      children: [
        Container(
          color: backgroundColor,
          child: (controller.selectedVariantIndex.value == null ||
                  product.value == null)
              ? const SizedBox()
              : Column(
                  children: [
                    HelperFunctions.spaceBtwItemsHeight(),

                    // Images slider
                    Obx(
                      () {
                        return CarouselSlider(
                          options: CarouselOptions(
                            onPageChanged: (index, _) =>
                                imageIndex.value = index,
                                // controller.updateCurrentImageIndex(index),
                          ),
                          items: product
                              .value!
                              .variants[controller.selectedVariantIndex.value!]
                              .images
                              .map(
                                (url) => CachedNetworkImage(
                                  imageUrl: url,
                                  placeholder: (_, __) => AspectRatio(
                                    aspectRatio: 1,
                                    child: CircularProgressIndicator(
                                      color: Colors.grey.shade100,
                                    ),
                                  ),
                                  errorWidget: (_, __, ___) =>
                                      const Placeholder(
                                    child: Text(
                                      GTexts.couldNotLoadImage,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      },
                    ),

                    HelperFunctions.spaceBtwItemsHeight(),

                    // Slider Dots
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0;
                              i <
                                  product
                                      .value!
                                      .variants[controller
                                          .selectedVariantIndex.value!]
                                      .images
                                      .length;
                              i++)
                            Container(
                              width: 20,
                              height: 4,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: imageIndex.value == i
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
            color: backgroundColor,
            height: 20,
          ),
        )
      ],
    );
  }
}
