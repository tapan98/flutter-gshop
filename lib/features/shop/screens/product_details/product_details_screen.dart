import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/sliver_appbar.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/shop/screens/checkout/order_summary_screen.dart';
import 'package:gshop/features/shop/screens/product_details/widgets/product_deliver_widget.dart';
import 'package:gshop/features/shop/screens/product_details/widgets/product_details_images_slider.dart';
import 'package:gshop/features/shop/screens/product_reviews/product_reviews_screen.dart';
import 'package:gshop/features/shop/screens/product_reviews/widgets/overall_product_rating_widget.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import '../product_reviews/widgets/user_review_card_widget.dart';
import 'widgets/product_details_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: GAppBar(),
      body: CustomScrollView(
        slivers: [
          const GSliverAppBar(),
          // Images Slider
          SliverToBoxAdapter(
            child: ProductDetailsImagesSlider(
                images: [1, 2, 3, 4].map((item) => GImages.product1).toList()),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

          // Product Details
          const SliverToBoxAdapter(child: ProductDetailsWidget()),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwItemsHeight()),

          const SliverToBoxAdapter(child: ProductDeliverWidget()),

          const SliverToBoxAdapter(
            child: SizedBox(height: GSizes.spaceBtwSections / 2),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: GSizes.defaultSpace,
              ),
              child: Divider(),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: GSizes.spaceBtwSections / 2),
          ),

          // Ratings & Reviews
          SliverToBoxAdapter(
            child: SectionHeading(
              title: "${GTexts.ratingsAndReviews} (255)",
              onTap: () => Get.to(() => const ProductReviewsScreen()),
            ),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

          // Product Rating Overview
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ratings & Reviews brief text
                  Text(
                    GTexts.ratingsAndReviewsBrief,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),

                  HelperFunctions.spaceBtwItemsHeight(),

                  const OverallProductRatingWidget(),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

          // User Review Card
          const SliverToBoxAdapter(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
            child: UserReviewCardWidget(),
          )),

          // Extra Space at the end
          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: TextButton(
                onPressed: () {}, child: const Text(GTexts.addToCart)),
          ),
          Expanded(
              child: ElevatedButton(
            onPressed: () => Get.to(() => const OrderSummaryScreen()),
            child: const Text(GTexts.buyNow),
          ))
        ],
      ),
    );
  }
}
