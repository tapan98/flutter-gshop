import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:gshop/util/constants/image_strings.dart';

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
            children: const [
              // Images, Titles & Subtitles
              Column(
                children: [
                  // Image
                  Image(image: AssetImage(GImages.onboardingImage1)),
                  // Title
                  Text("data")

                  // Subtitle
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
