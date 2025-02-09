import 'package:flutter/material.dart';
import 'package:gshop/util/constants/colors.dart';

class GTextButtonTheme {

  // Light Theme
  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: GColors.primary,
      textStyle: const TextStyle(fontSize: 16, color: GColors.black, fontWeight: FontWeight.w600),
    ),
  );

  // Dark Theme
  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: GColors.primary,
      textStyle: const TextStyle(fontSize: 16, color: GColors.textWhite, fontWeight: FontWeight.w600),
    ),
  );

  GTextButtonTheme._();
}