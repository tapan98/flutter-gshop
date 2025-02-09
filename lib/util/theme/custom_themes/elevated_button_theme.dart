import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class GElevatedButtonTheme {

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: GColors.light,
      backgroundColor: GColors.primary,
      disabledForegroundColor: GColors.darkGrey,
      disabledBackgroundColor: GColors.buttonDisabled,
      side: const BorderSide(color: GColors.primary),
      padding: const EdgeInsets.symmetric(vertical: GSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: GColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(GSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: GSizes.buttonElevation,
      foregroundColor: GColors.light,
      backgroundColor: GColors.primary,
      disabledForegroundColor: GColors.darkGrey,
      disabledBackgroundColor: GColors.darkerGrey,
      side: const BorderSide(color: GColors.primary),
      padding: const EdgeInsets.symmetric(vertical: GSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: GColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(GSizes.buttonRadius)),
    ),
  );

  GElevatedButtonTheme._();

}