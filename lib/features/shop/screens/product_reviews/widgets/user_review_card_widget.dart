import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/common/widgets/products/rating/ratings_bar.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCardWidget extends StatelessWidget {
  const UserReviewCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // User Avatar Image, Username & Option Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image & Username
            Row(
              children: [
                // Image
                const CircleAvatar(
                  backgroundImage: AssetImage(GImages.dummyPersonImage),
                ),

                HelperFunctions.spaceBtwItemsWidth(),
                // Username
                const Text("Tapan"),
              ],
            ),

            // Option Button
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                size: 20,
              ),
            ),
          ],
        ),

        HelperFunctions.spaceBtwItemsHeight(),

        // User Rating & Date
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Rating
            const ProductRatingsBar(
              rating: 4.3,
              showRatingNumber: false,
            ),

            HelperFunctions.spaceBtwItemsWidth(),
            // Date
            Text("18 Feb, 2025",
                style: Theme.of(context).textTheme.labelMedium),
          ],
        ),

        HelperFunctions.spaceBtwItemsHeight(),

        // User Description
        const ReadMoreText(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
          trimMode: TrimMode.Line,
          trimLines: 2,
          trimExpandedText: " show less",
          moreStyle: TextStyle(
            color: GColors.primary
          ),
          lessStyle: TextStyle(
            color: GColors.primary
          ),
        ),
      ],
    );
  }
}
