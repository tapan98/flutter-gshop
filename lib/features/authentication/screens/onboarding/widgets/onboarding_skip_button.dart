import 'package:flutter/material.dart';
import 'package:gshop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/device_utils/device_utility.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final isDark = HelperFunctions.isDarkMode(context);
    return Positioned(
      top: DeviceUtils.getAppBarHeight(),
      right: GSizes.defaultSpace,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: isDark ? GColors.white : GColors.black,
        ),
        onPressed: controller.skip,
        child: Text(GTexts.skip),
      ),
    );
  }
}
