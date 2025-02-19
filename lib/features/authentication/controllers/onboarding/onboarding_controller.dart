import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/features/authentication/screens/login/login_screen.dart';
import 'package:gshop/util/logger/logger.dart';

/// Controls the Onboarding navigation
///
/// Instantiated in OnboardingScreen
class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // Variables
  final pageIndex = 0.obs;
  final pageController = PageController();

  // Methods

  // Update current page index on scroll
  void updatePageIndex(int index) => pageIndex.value = index;

  // Update current page index on next page
  void next() {
    if (pageIndex.value < 2) {
      pageIndex.value++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      getOffOnboarding();
    }
  }

  // Update current page index on skip
  void skip() {
    if (pageIndex.value < 2) {
      pageIndex.value = 2;
      pageController.jumpToPage(2);
    } else {
      getOffOnboarding();
    }
  }

  /// Marks the app as it isn't launched for the first time
  void getOffOnboarding() {
    AuthenticationRepository.instance.deviceStorage
        .write(AuthenticationRepository.isFirstTime, false);
    Get.offAll(() => const LoginScreen());
  }

  @override
  void onClose() {
    Log.debug("disposing PageController...");
    pageController.dispose();
    super.onClose();
  }
}
