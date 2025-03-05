import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/custom_shapes/container/rounded_corner_container.dart';
import 'package:gshop/common/widgets/images/rounded_corner_image.dart';
import 'package:gshop/common/widgets/products/rating/rating_chip.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/common/widgets/texts/product_price_text.dart';
import 'package:gshop/features/shop/controllers/products_controller.dart';
import 'package:gshop/features/shop/models/product_model.dart';
import 'package:gshop/features/shop/models/product_variant_model.dart';
import 'package:gshop/features/shop/screens/product_details/product_details_screen.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';

class ProductCardVertical extends StatefulWidget {
  const ProductCardVertical({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  State<ProductCardVertical> createState() => _ProductCardVerticalState();
}

class _ProductCardVerticalState extends State<ProductCardVertical> {
  final productsController = ProductsController.instance;

  Future<ProductModel?>? _product;

  @override
  void initState() {
    super.initState();
    _product = productsController.fetchProductById(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _product,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerWidget(radius: 10);
        } else if (snapshot.hasData && snapshot.data != null) {
          return _buildProductCard(snapshot.data!);
        } else {
          return _buildCouldNotLoadProductWidget();
        }
      },
    );
  }

  Widget _buildProductCard(ProductModel product) {
    final imageBackgroundColor = Colors.white;

    // Check if there are any variants
    final hasVariants = product.variants.isNotEmpty;
    // Get the first variant or null if there are no variants
    final ProductVariantModel? firstVariant =
        hasVariants ? product.variants.first : null;

    final bool shouldShowOriginalPrice =
        firstVariant != null && firstVariant.isDiscountApplicable;

    return InkWell(
      // TODO: Route to correct product details
      onTap: () => Get.to(
        () => ProductDetailsScreen(productId: widget.productId),
      ),
      child: SizedBox(
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image & Rating on bottom left
            RoundedCornerContainer(
              height: 190,
              backgroundColor: imageBackgroundColor,
              child: Stack(
                children: [
                  // Image
                  RoundedCornerImage(
                    imageUrl: product.firstImage,
                    isNetworkImage: true,
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

            // Title, Price & Offer texts
            Column(
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
                const SizedBox(height: GSizes.spaceBtwItems / 2),

                // Price
                if (firstVariant != null)
                  Wrap(
                    children: [
                      // calculate discounted price from discount percentage
                      ProductPriceText(
                          price: _getFormattedDiscountedPrice(
                            variant: firstVariant,
                          ),
                          isLarge: true),

                      // actual price strikethrough
                      if (shouldShowOriginalPrice)
                        ProductPriceText(
                            price: firstVariant.price.toStringAsFixed(2),
                            lineThrough: true),
                    ],
                  ),

                const SizedBox(height: GSizes.spaceBtwItems / 2),

                // offer text
                if (product.offerText != null)
                  Text(
                    product.offerText!,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getFormattedDiscountedPrice({required ProductVariantModel variant}) {
    if (!variant.isDiscountApplicable || variant.discountPercentage == 1) {
      return variant.price.toStringAsFixed(2);
    }

    return (variant.price * (1 - variant.discountPercentage))
        .toStringAsFixed(2);
  }

  Widget _buildErrorWidget(Object? error) {
    return Placeholder(
      child: Center(
        child: Text("Error: $error", textAlign: TextAlign.center),
      ),
    );
  }

  Widget _buildCouldNotLoadProductWidget() {
    return const Placeholder(
      child: Center(
        child: Text(GTexts.couldNotLoadProduct, textAlign: TextAlign.center),
      ),
    );
  }
}
