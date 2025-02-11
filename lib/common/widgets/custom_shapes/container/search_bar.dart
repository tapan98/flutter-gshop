import 'package:flutter/material.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/device_utils/device_utility.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class GSearchBar extends StatelessWidget {
  const GSearchBar({
    super.key,
    required this.text,
    this.icon = Icons.search,
    this.transparentBackground = false,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
  });

  final String text;
  final IconData icon;
  final bool transparentBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          HelperFunctions.spaceBtwItemsHeight(),
          Padding(
            padding: padding,
            child: Container(
              width: DeviceUtils.getScreenWidth(context),
              padding: EdgeInsets.all(GSizes.md),
              decoration: BoxDecoration(
                color: transparentBackground
                    ? Colors.transparent
                    : isDark
                        ? GColors.dark
                        : GColors.white,
                borderRadius: BorderRadius.circular(GSizes.cardRadiusMd),
                border: showBorder ? Border.all(color: GColors.grey) : null,
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  HelperFunctions.spaceBtwItemsWidth(),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
