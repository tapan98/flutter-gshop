import 'package:flutter/material.dart';
import 'package:gshop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/device_utils/device_utility.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight(),
      right: GSizes.defaultSpace,
      child: ElevatedButton(
        // TODO: update index to next page
        onPressed: OnboardingController.instance.next,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: isDark ? GColors.primary : Colors.black,
          side: BorderSide.none,
        ),
        child: Icon(Icons.keyboard_arrow_right, color: GColors.white),
      ),
    );
  }
}
