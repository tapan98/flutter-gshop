import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/layouts/products_grid_layout.dart';
import 'package:gshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/shop/controllers/products_controller.dart';
import 'package:gshop/features/shop/screens/popular_products/popular_products_screen.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';

class HomePopularProductsSection extends StatelessWidget {
  /// Warning: Assumes that popular product ID's have already been fetched
  const HomePopularProductsSection({super.key});

  final productsDisplayCount = 4;

  @override
  Widget build(BuildContext context) {
    final productsController = ProductsController.instance;
    return Column(
      children: [
        // Popular Products Heading
        SectionHeading(
          title: GTexts.popularProducts,
          buttonTitle: GTexts.viewAll,
          onTap: () => Get.to(() => const PopularProductsScreen()),
        ),

        // Vertical Product Cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
          child: ProductGridLayout(
            itemBuilder: (_, index) {
              return ProductCardVertical(
                productId: productsController.popularProductIds[index],
              );
            },
            itemCount:
                // top [productDisplayCount] popular products
                productsController.popularProductIds.length <
                        productsDisplayCount
                    ? productsController.popularProductIds.length
                    : productsDisplayCount,
          ),
        ),
      ],
    );
  }
}
