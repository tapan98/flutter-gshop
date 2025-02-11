import 'package:flutter/material.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class RatingChip extends StatelessWidget {
  const RatingChip({
    super.key,
    required this.rating,
    this.ratingIcon = Icons.star,
    this.totalRatings,
  });

  /// Rating out of 5
  final String rating;
  final IconData ratingIcon;
  final String? totalRatings;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$rating ",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: GColors.black)),
        Icon(
          ratingIcon,
          color: Colors.green,
          size: GSizes.iconSm,
        ),
        if (totalRatings != null)
          Text("($totalRatings)",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: GColors.black.withValues(alpha: 0.5))),
      ],
    );
  }
}
