import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:gshop/common/widgets/layouts/grid_layout.dart';
import 'package:gshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/shop/screens/home/widgets/home_product_categories.dart';
import 'package:gshop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/device_utils/device_utility.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import 'widgets/address_bar.dart';
import '../../../../common/widgets/custom_shapes/container/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  AddressBar(),
                  GSearchBar(text: "Search for Products"),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

          // Promo Slider
          SliverToBoxAdapter(
            child: PromoSlider(
              banners: [
                GImages.banner1,
                GImages.banner2,
                GImages.banner3,
              ],
            ),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

          // Product Categories
          SliverToBoxAdapter(
            child: HomeProductCategories(),
          ),

          SliverToBoxAdapter(
              child: const SizedBox(height: GSizes.spaceBtwSections / 2)),

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
              padding: const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
              child: GridLayout(
                itemBuilder: (context, index) => ProductCardVertical(
                  productTitle: "Samsung Galaxy S24 Ultra",
                  imageUrl: GImages.product1,
                  productRating: "4.3",
                  offerText: "Free Delivery",
                ),
                itemCount: 4,
              ),
            ),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

        ],
      ),
    );
  }
}