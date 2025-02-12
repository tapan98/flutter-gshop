import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/icons/circular_icon.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CartProductQuantityWithAddRemoveButtons extends StatelessWidget {
  const CartProductQuantityWithAddRemoveButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Remove Button
        CircularIcon(
          icon: Icons.remove,
          width: 32,
          height: 32,
          size: GSizes.md,
          color: isDark ? GColors.white : GColors.black,
          backgroundColor: isDark ? GColors.darkerGrey : GColors.light,
        ),

        HelperFunctions.spaceBtwItemsWidth(),

        // Quantity
        // TODO: fetch product quantity
        Text("3", style: Theme.of(context).textTheme.titleSmall),
        HelperFunctions.spaceBtwItemsWidth(),

        // Add Button
        CircularIcon(
          icon: Icons.remove,
          width: 32,
          height: 32,
          size: GSizes.md,
          color: isDark ? GColors.white : GColors.black,
          backgroundColor: GColors.primary,
        )
      ],
    );
  }
}
