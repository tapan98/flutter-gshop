import 'package:flutter/material.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';

class RoundedCornerContainer extends StatelessWidget {
  const RoundedCornerContainer({
    super.key,
    this.width,
    this.height,
    this.radius = GSizes.cardRadiusLg,
    this.showBorder = false,
    this.borderColor = GColors.borderPrimary,
    this.backgroundColor = GColors.grey,
    this.padding,
    this.margin,
    this.child,
  });

  final double? width, height;
  final double radius;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
