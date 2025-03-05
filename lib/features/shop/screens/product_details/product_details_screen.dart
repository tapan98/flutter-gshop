import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/common/widgets/appbar/sliver_appbar.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/shop/controllers/products_controller.dart';
import 'package:gshop/features/shop/models/product_model.dart';
import 'package:gshop/features/shop/models/product_variant_model.dart';
import 'package:gshop/features/shop/screens/product_details/widgets/product_deliver_widget.dart';
import 'package:gshop/features/shop/screens/product_details/widgets/product_details_bottom_navigation_bar.dart';
import 'package:gshop/features/shop/screens/product_details/widgets/product_details_images_slider.dart';
import 'package:gshop/features/shop/screens/product_reviews/product_reviews_screen.dart';
import 'package:gshop/features/shop/screens/product_reviews/widgets/overall_product_rating_widget.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import '../product_reviews/widgets/user_review_card_widget.dart';
import 'widgets/product_details_widget.dart';
import 'widgets/product_variations_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
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
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildShimmerLoadingWidget();
          } else if (snapshot.hasData && snapshot.data != null) {
            return _buildProductDetails(snapshot.data!);
          } else {
            return _buildCouldNotLoadProductWidget();
          }
        });
  }

  Widget _buildProductDetails(ProductModel product) {
    if (product.variants.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text("Product has no variants"),
        ),
      );
    }
    final ProductVariantModel productVariant = product.variants.first;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const GSliverAppBar(),
          // Images Slider
          SliverToBoxAdapter(
            child: ProductDetailsImagesSlider(images: productVariant.images),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),

          // Product Details
          SliverToBoxAdapter(
            child: ProductDetailsWidget(
              brandTitle: 'SomeBrand',
              productTitle: product.title,
              price: productVariant.price,
              averageRating: product.averageRating,
              totalRatings: product.totalRatings,
            ),
          ),

          SliverToBoxAdapter(child: HelperFunctions.spaceBtwItemsHeight()),

          // Variation
          SliverToBoxAdapter(child: ProductVariationsWidget(product: product)),

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
              padding:
                  const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
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
          const SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
            child: UserReviewCardWidget(),
          )),

          // Extra Space at the end
          SliverToBoxAdapter(child: HelperFunctions.spaceBtwSectionsHeight()),
        ],
      ),
      bottomNavigationBar: const ProductDetailsBottomNavigationBar(),
    );
  }

  Widget _buildShimmerLoadingWidget() {
    return const Scaffold(
      appBar: GAppBar(
        title: ShimmerWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.all(GSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shimmer for image
            ShimmerWidget(
              radius: 10,
              height: 200,
              width: double.infinity,
            ),
            SizedBox(height: GSizes.spaceBtwSections),

            // Shimmer for brand & ratings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerWidget(
                  radius: 10,
                  height: 10,
                  width: 70,
                ),
                ShimmerWidget(
                  radius: 10,
                  height: 10,
                  width: 100,
                ),
              ],
            ),

            SizedBox(height: GSizes.spaceBtwSections),

            // Shimmer to title
            ShimmerWidget(
              radius: 10,
              height: 20,
              width: 200,
            ),

            SizedBox(height: GSizes.spaceBtwItems),

            // Shimmer for price
            ShimmerWidget(
              radius: 10,
              height: 40,
              width: 150,
            ),

            SizedBox(height: GSizes.spaceBtwSections),

            // Shimmer for Chips 1
            Row(
              children: [
                ShimmerWidget(
                  radius: 10,
                  width: 150,
                  height: 50,
                ),
                ShimmerWidget(
                  radius: 10,
                  width: 150,
                  height: 50,
                ),
              ],
            ),

            SizedBox(height: GSizes.spaceBtwItems),

            // Shimmer for Chips 2
            Row(
              children: [
                ShimmerWidget(
                  radius: 10,
                  width: 150,
                  height: 50,
                ),
                ShimmerWidget(
                  radius: 10,
                  width: 150,
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCouldNotLoadProductWidget() {
    return const Scaffold(
      appBar: GAppBar(),
      body: Center(
        child: Text(GTexts.couldNotLoadProduct, textAlign: TextAlign.center),
      ),
    );
  }

  Widget _buildErrorWidget(Object? error) {
    return Scaffold(
      appBar: const GAppBar(),
      body: Center(
        child: Text("Error: $error", textAlign: TextAlign.center),
      ),
    );
  }
}
