import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/custom_shapes/container/rounded_corner_container.dart';
import 'package:gshop/common/widgets/images/rounded_corner_image.dart';
import 'package:gshop/common/widgets/products/rating/rating_chip.dart';
import 'package:gshop/common/widgets/texts/product_price_text.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
    required this.imageUrl,
    required this.productTitle,
    this.offerText, required this.productRating, this.totalRatings,
  });

  final String imageUrl, productTitle, productRating;
  final String? totalRatings;
  final String? offerText;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return SizedBox(
      width: 140,
      child: Column(
        children: [
          // Image & Rating on bottom left
          RoundedCornerContainer(
            height: 190,
            backgroundColor: isDark ? GColors.darkerGrey : GColors.grey,
            child: Stack(
              children: [
                // Image
                RoundedCornerImage(imageUrl: imageUrl),
                // Rating on Bottom left
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: RatingChip(rating: productRating,totalRatings: totalRatings),
                ),
              ],
            ),
          ),

          HelperFunctions.spaceBtwItemsHeight(),

          const SizedBox(height: GSizes.spaceBtwItems / 2),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Product Details
              Text(
                productTitle,
                style: Theme.of(context).textTheme.labelLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              // Price
              Wrap(
                children: [
                  // TODO: Fetch price
                  ProductPriceText(price: "100,000", lineThrough: true),
                  HelperFunctions.spaceBtwItemsWidth(),
                  ProductPriceText(price: "71,999", isLarge: true),
                ],
              ),

              const SizedBox(height: GSizes.spaceBtwItems / 2),

              if (offerText != null)
                Text(
                  offerText!,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),

        ],
      ),
    );
  }
}
