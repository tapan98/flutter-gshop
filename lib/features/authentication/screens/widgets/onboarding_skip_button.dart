import 'package:flutter/material.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/device_utils/device_utility.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Positioned(
      top: DeviceUtils.getAppBarHeight(),
      right: GSizes.defaultSpace,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: isDark ? GColors.white : GColors.black,
        ),
        // TODO: update index to last page
        onPressed: () {},
        child: Text(GTexts.skip),
      ),
    );
  }
}
