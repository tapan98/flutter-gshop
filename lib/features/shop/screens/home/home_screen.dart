import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:gshop/common/widgets/layouts/grid_layout.dart';
import 'package:gshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/shop/controllers/products_controller.dart';
import 'package:gshop/features/shop/screens/home/widgets/home_product_categories.dart';
import 'package:gshop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/device_utils/device_utility.dart';
import 'package:gshop/util/helpers/helper_functions.dart';
import 'package:gshop/util/logger/logger.dart';

import 'widgets/address_bar.dart';
import '../../../../common/widgets/custom_shapes/container/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = Get.put(ProductsController());
    HelperFunctions.setDynamicStatusBarTheme(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: PrimaryHeaderContainer(
              child: Column(
                children: [
                  SizedBox(height: DeviceUtils.getAppBarHeight()),
                  const AddressBar(foregroundColor: GColors.black),
                  HelperFunctions.spaceBtwItemsHeight(),
                  const GSearchBar(text: "Search for Products"),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

          // Promo Slider
          const SliverToBoxAdapter(
            child: PromoSlider(),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

          // Product Categories
          const SliverToBoxAdapter(
            child: Center(child: HomeProductCategories()),
          ),

          const SliverToBoxAdapter(
              child: SizedBox(height: GSizes.spaceBtwSections / 2)),

          // Popular Products Heading
          SliverToBoxAdapter(
            child: SectionHeading(
              title: "Popular Products",
              buttonTitle: "View All",
              onTap: () {},
            ),
          ),

          // Vertical Product Cards
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
              child: ProductGridLayout(
                itemBuilder: (context, index) {
                  Log.debug(
                      "product.value: ${productsController.product.value}");
                  return Obx(
                    () => ProductCardVertical(
                      // TODO: For testing purpose, remove/modify later
                      product: productsController.product.value,
                      showShimmer: productsController.isProductLoading.value,
                    ),
                  );
                },
                itemCount: 1,
              ),
            ),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),
        ],
      ),
    );
  }
}
