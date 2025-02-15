import 'package:flutter/material.dart';
import 'package:gshop/util/constants/colors.dart';

class GradientStyles {

  static const primaryGradient = LinearGradient(
    colors: [
      GColors.primary,
      GColors.primaryBackground,
    ],
    begin: Alignment.topLeft,
    end: Alignment(3.5, 2),
  );

  GradientStyles._();
}