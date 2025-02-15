import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/sliver_appbar.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/shop/screens/checkout/order_summary_screen.dart';
import 'package:gshop/features/shop/screens/product_details/widgets/product_deliver_widget.dart';
import 'package:gshop/features/shop/screens/product_details/widgets/product_details_images_slider.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import 'widgets/product_details_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: GAppBar(),
      body: CustomScrollView(
        slivers: [
          GSliverAppBar(),
          // Images Slider
          SliverToBoxAdapter(
            child: ProductDetailsImagesSlider(
                images: [1, 2, 3, 4].map((item) => GImages.product1).toList()),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

          // Product Details
          SliverToBoxAdapter(child: ProductDetailsWidget()),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwItemsHeight()),

          SliverToBoxAdapter(child: ProductDeliverWidget()),

          SliverToBoxAdapter(
            child: SizedBox(height: GSizes.spaceBtwSections / 2),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: GSizes.defaultSpace,
              ),
              child: Divider(),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: GSizes.spaceBtwSections / 2),
          ),

          // Reviews
          SliverToBoxAdapter(
            child: SectionHeading(
              title: "Reviews (255)",
              onTap: () {},
            ),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

          SliverToBoxAdapter(
            child: Row(
              children: [],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: TextButton(onPressed: () {}, child: Text(GTexts.addToCart)),
          ),
          Expanded(
              child: ElevatedButton(
            onPressed: () => Get.to(() => const OrderSummaryScreen()),
            child: Text(GTexts.buyNow),
          ))
        ],
      ),
    );
  }
}
