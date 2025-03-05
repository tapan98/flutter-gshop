import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';

class ProductRatingsBar extends StatelessWidget {
  const ProductRatingsBar({
    super.key,
    required this.rating,
    this.totalRatings,
    this.showRatingNumber = true,
    this.showTotalRatings = true,
  });

  final double rating;
  final int? totalRatings;
  final bool showRatingNumber, showTotalRatings;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Rating text
        if (showRatingNumber)
          Row(
            children: [
              Text(rating.toStringAsFixed(1), style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(width: GSizes.spaceBtwItems / 2),
            ],
          ),
        RatingBarIndicator(
          rating: rating,
          itemSize: 15,
          unratedColor: GColors.grey,
          itemBuilder: (BuildContext context, int index) {
            return const FaIcon(FontAwesomeIcons.solidStar,
                color: Colors.amber);
          },
        ),

        if (totalRatings != null && showRatingNumber)
          Row(
            children: [
              const SizedBox(width: GSizes.spaceBtwItems / 2),
              Text(
                "($totalRatings)",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          )
      ],
    );
  }
}
