import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';

class OverallProductRatingWidget extends StatelessWidget {
  const OverallProductRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Total Rating
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Total Rating
              Text("4.3", style: Theme.of(context).textTheme.displayLarge),

              // Stars
              RatingBarIndicator(
                rating: 4.3,
                itemSize: 15,
                unratedColor: GColors.grey,
                itemBuilder: (context, index) =>
                    const FaIcon(FontAwesomeIcons.solidStar, color: Colors.amber),
              ),

              const SizedBox(height: GSizes.spaceBtwItems/2),

              // Rating Count
              Text("255", style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
        ),

        // Rating Bars
        const Expanded(
          flex: 2,
          child: Column(
            children: [
              RatingProgressIndicator(leadingText: "5", rating: 0.8),
              RatingProgressIndicator(leadingText: "4", rating: 0.7),
              RatingProgressIndicator(leadingText: "3", rating: 0.2),
              RatingProgressIndicator(leadingText: "2", rating: 0.2),
              RatingProgressIndicator(leadingText: "1", rating: 0.1),
            ],
          ),
        ),
      ],
    );
  }
}
