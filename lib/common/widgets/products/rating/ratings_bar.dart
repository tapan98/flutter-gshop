import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';

class RatingsBar extends StatelessWidget {
  const RatingsBar({super.key, required this.rating, this.totalRatings});

  final double rating;
  final int? totalRatings;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Rating text
        Text("$rating", style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(width: GSizes.spaceBtwItems / 2),
        RatingBarIndicator(
          rating: rating,
          itemSize: 15,
          unratedColor: GColors.grey,
          itemBuilder: (BuildContext context, int index) {
            return FaIcon(FontAwesomeIcons.solidStar, color: Colors.amber);
          },
        ),

        if (totalRatings != null)
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
