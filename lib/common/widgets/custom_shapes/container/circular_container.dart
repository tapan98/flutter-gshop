import 'package:flutter/material.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.width = GSizes.iconMd,
    this.height = GSizes.iconMd,
    this.backgroundColor,
    this.border,
    this.padding = const EdgeInsets.all(GSizes.xs),
    this.child,
  });

  final double? width, height;
  final Color? backgroundColor;
  final BoxBorder? border;
  final EdgeInsetsGeometry padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: (backgroundColor == null)
            ? (isDark ? GColors.grey : GColors.white)
            : backgroundColor,
        borderRadius: BorderRadius.circular(100),
        border: border,
      ),
      child: child,
    );
  }
}
