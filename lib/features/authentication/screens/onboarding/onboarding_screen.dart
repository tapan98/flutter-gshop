import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/text_strings.dart';

import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontally scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndex,
            children: [
              // Images, Titles & Subtitles
              OnboardingPage(
                  title: GTexts.onboardingTitle1,
                  subtitle: GTexts.onboardingSubtitle1,
                  image: GImages.onboardingImage1),
              OnboardingPage(
                  title: GTexts.onboardingTitle2,
                  subtitle: GTexts.onboardingSubtitle2,
                  image: GImages.onboardingImage2),
              OnboardingPage(
                  title: GTexts.onboardingTitle3,
                  subtitle: GTexts.onboardingSubtitle3,
                  image: GImages.onboardingImage3),
            ],
          ),

          // Next Button
          OnboardingNextButton(),

          // Skip button
          OnboardingSkipButton(),
        ],
      ),
    );
  }
}
