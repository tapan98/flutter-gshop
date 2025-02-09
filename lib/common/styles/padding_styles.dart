import 'package:flutter/material.dart';
import 'package:gshop/util/constants/sizes.dart';

class PaddingStyles {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: GSizes.appBarHeight,
    left: GSizes.defaultSpace,
    right: GSizes.defaultSpace,
    bottom: GSizes.defaultSpace,
  );

  PaddingStyles._();
}