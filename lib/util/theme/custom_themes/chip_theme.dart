import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class GChipTheme {

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: GColors.grey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: GColors.black),
    selectedColor: GColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: GColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: GColors.darkerGrey,
    labelStyle: TextStyle(color: GColors.white),
    selectedColor: GColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: GColors.white,
  );

  GChipTheme._();
  
}
