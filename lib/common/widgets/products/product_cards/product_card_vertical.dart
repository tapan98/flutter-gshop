import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/custom_shapes/container/rounded_corner_container.dart';
import 'package:gshop/common/widgets/images/rounded_corner_image.dart';
import 'package:gshop/common/widgets/products/rating/rating_chip.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/common/widgets/texts/product_price_text.dart';
import 'package:gshop/features/shop/models/product_model.dart';
import 'package:gshop/features/shop/screens/product_details/product_details_screen.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';
import 'package:gshop/util/logger/logger.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
    required this.product,
    required this.showShimmer,
  });

  final ProductModel product;
  final bool showShimmer;

  @override
  Widget build(BuildContext context) {
    Log.debug("Building product card vertical with product: $product");
    final isDark = HelperFunctions.isDarkMode(context);
    return InkWell(
      // TODO: Route to correct product details
      onTap: () => Get.to(() => const ProductDetailsScreen()),
      child: SizedBox(
        width: 140,
        child: Column(
          children: [
            // Image & Rating on bottom left
            RoundedCornerContainer(
              height: 190,
              backgroundColor: isDark ? GColors.darkerGrey : GColors.grey,
              child: showShimmer
                  ? const ShimmerWidget(radius: 10)
                  : Stack(
                      children: [
                        // Image
                        RoundedCornerImage(
                          imageUrl: product.firstImage,
                          isNetworkImage: true,
                          showShimmer: showShimmer,
                        ),
                        // Rating on Bottom left
                        const Positioned(
                          bottom: 12,
                          left: 12,
                          // TODO: Get ratings
                          child: RatingChip(
                            rating: "4.5",
                            totalRatings: null,
                          ),
                        ),
                      ],
                    ),
            ),


            const SizedBox(height: GSizes.spaceBtwItems / 2),

            showShimmer
                ? const ShimmerWidget(
                    height: 40,
                    radius: 10,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Details
                      Text(
                        product.title,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      
                      // Price
                      Wrap(
                        children: [
                          // TODO: Fetch price
                          ProductPriceText(
                              price:
                              (product.variants.first.price * 0.5461580474)
                                  .toStringAsFixed(2),
                              isLarge: true),
                          const SizedBox(width: GSizes.spaceBtwItems/2),
                          ProductPriceText(
                              price: product.variants.first.price.toStringAsFixed(2),
                              lineThrough: true),

                        ],
                      ),

                      const SizedBox(height: GSizes.spaceBtwItems / 2),

                      // TODO: Get offer text
                      // if (offerText != null)
                      //   Text(
                      //     offerText!,
                      //     style: Theme.of(context).textTheme.bodyLarge,
                      //     overflow: TextOverflow.ellipsis,
                      //   ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
