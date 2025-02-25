import 'package:flutter/material.dart';
import 'package:gshop/util/constants/sizes.dart';

class PaddingStyles {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: GSizes.appBarHeight,
    left: GSizes.defaultSpace,
    right: GSizes.defaultSpace,
    bottom: GSizes.defaultSpace,
  );
  
  static EdgeInsetsGeometry horizontalListPadding(
      {required int length, required int index}) {
    return EdgeInsets.only(
      left: (index == 0) // if first item, add left padding
          ? GSizes.defaultSpace
          : GSizes.spaceBtwItems/2,
      right: (index == length - 1) // if last item, add right padding
          ? GSizes.defaultSpace
          : 0,
    );
  }

  PaddingStyles._();
}