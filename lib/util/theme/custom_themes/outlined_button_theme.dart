import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class GOutlinedButtonTheme {
  
  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: GColors.dark,
      side: const BorderSide(color: GColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: GColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: GSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(GSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: GColors.light,
      side: const BorderSide(color: GColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: GColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: GSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(GSizes.buttonRadius)),
    ),
  );

  GOutlinedButtonTheme._();
}
