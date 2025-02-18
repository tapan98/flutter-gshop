import 'package:flutter/material.dart';
import 'package:gshop/features/shop/screens/product_reviews/widgets/product_review_appbar.dart';
import 'package:gshop/features/shop/screens/product_reviews/widgets/ratings_filter_widget.dart';
import 'package:gshop/features/shop/screens/product_reviews/widgets/sort_reviews_option.dart';
import 'package:gshop/features/shop/screens/product_reviews/widgets/user_review_card_widget.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductReviewAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HelperFunctions.spaceBtwItemsHeight(),

            // Ratings Filter ChoiceChip
            const RatingsFilterWidget(),

            HelperFunctions.spaceBtwItemsHeight(),

            // Sort Reviews option
            const SortReviewsOption(),

            // User Reviews
            const Padding(
              padding: EdgeInsets.all(GSizes.defaultSpace),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: GSizes.defaultSpace),
                    child: UserReviewCardWidget(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: GSizes.defaultSpace),
                    child: UserReviewCardWidget(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: GSizes.defaultSpace),
                    child: UserReviewCardWidget(),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
