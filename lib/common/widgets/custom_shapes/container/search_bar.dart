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
    this.inputField = false,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
    this.height,
  });

  final String text;
  final IconData icon;
  final bool transparentBackground, showBorder, inputField;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          // HelperFunctions.spaceBtwItemsHeight(),
          Padding(
            padding: padding,
            child: Container(
              width: DeviceUtils.getScreenWidth(context),
              height: height,
              padding: inputField ? EdgeInsets.symmetric(horizontal: GSizes.md) : EdgeInsets.all(GSizes.md),
              decoration: BoxDecoration(
                color: transparentBackground
                    ? Colors.transparent
                    : isDark
                        ? GColors.dark
                        : GColors.white,
                borderRadius: BorderRadius.circular(GSizes.cardRadiusMd),
                border: showBorder ? Border.all(color: GColors.grey) : null,
              ),
              child: inputField ? TextField(
                // TODO: Assign Search orders controller
                // controller: ,
                onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: text,
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none
                ),
              ) : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.search, color: isDark ? GColors.grey : GColors.darkerGrey),
                  HelperFunctions.spaceBtwItemsWidth(),
                  Flexible(
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
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
