import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/products/rating/ratings_bar.dart';
import 'package:gshop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:gshop/common/widgets/texts/product_title_text.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import 'product_variation_widget.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Brand Name & Ratings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BrandTitleTextWithVerifiedIcon(title: "Samsung"),
      
                // Rating Bar
                RatingsBar(rating: 4.5, totalRatings: 100),
              ],
            ),
      
            HelperFunctions.spaceBtwItemsHeight(),
      
            // Product Title
            ProductTitleText(title: "Samsung Galaxy S24 Ultra"),
      
            HelperFunctions.spaceBtwItemsHeight(),
      
            // Price
            Text("₹71,000", style: Theme.of(context).textTheme.headlineMedium),
      
            HelperFunctions.spaceBtwItemsHeight(),
      
            // Variation
            ProductVariationWidget(),
          ],
        ),
      ),
    );
  }
}
