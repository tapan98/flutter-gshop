import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/custom_shapes/container/rounded_corner_container.dart';
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
    final isDark = HelperFunctions.isDarkMode(context);
    return RoundedCornerContainer(
      padding: const EdgeInsets.all(GSizes.xs),
      radius: GSizes.xs,
      backgroundColor: isDark ? GColors.grey : GColors.white,
      child: Row(
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
      ),
    );
  }
}
