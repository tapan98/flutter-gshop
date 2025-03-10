import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/products/rating/ratings_bar.dart';
import 'package:gshop/common/widgets/texts/product_price_text.dart';
import 'package:gshop/common/widgets/texts/product_title_text.dart';
import 'package:gshop/features/shop/screens/product_details/widgets/proudct_details_brand_name.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    super.key,
    required this.brandId,
    required this.productTitle,
    required this.price,
    this.averageRating,
    this.totalRatings,
    this.discountedPrice,
  });

  final String brandId, productTitle;
  final double price;
  final double? discountedPrice;
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
                Flexible(child: ProductDetailsBrandName(brandId: brandId)),

                // Rating Bar
                if (averageRating != null && totalRatings != null)
                  ProductRatingsBar(
                      rating: averageRating!, totalRatings: totalRatings),
              ],
            ),

            HelperFunctions.spaceBtwItemsHeight(),

            // Product Title
            ProductTitleText(title: productTitle),

            HelperFunctions.spaceBtwItemsHeight(),

            // Price
            Opacity(
              opacity: discountedPrice == null ? 1 : 0.5,
              child: ProductPriceText(
                price: price.toStringAsFixed(2),
                textStyle: discountedPrice == null
                    ? Theme.of(context).textTheme.headlineMedium
                    : Theme.of(context).textTheme.bodyLarge!.apply(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey),
              ),
            ),
            // Discounted price if any
            if (discountedPrice != null)
              ProductPriceText(
                  price: discountedPrice!.toStringAsFixed(2),
                  textStyle: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
