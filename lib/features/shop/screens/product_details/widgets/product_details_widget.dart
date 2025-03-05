import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/products/rating/ratings_bar.dart';
import 'package:gshop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:gshop/common/widgets/texts/product_title_text.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';


class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    super.key,
    required this.brandTitle,
    required this.productTitle,
    required this.price,
    this.averageRating,
    this.totalRatings,
  });

  final String brandTitle, productTitle;
  final double price;
  final double? averageRating;
  final int? totalRatings;

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
                BrandTitleTextWithVerifiedIcon(title: brandTitle),

                // Rating Bar
                if (averageRating != null && totalRatings != null)
                   ProductRatingsBar(rating: averageRating!, totalRatings: totalRatings),
              ],
            ),

            HelperFunctions.spaceBtwItemsHeight(),

            // Product Title
             ProductTitleText(title: productTitle),

            HelperFunctions.spaceBtwItemsHeight(),

            // Price
            // TODO: Format price text
            Text("₹${price.toStringAsFixed(2)}", style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
