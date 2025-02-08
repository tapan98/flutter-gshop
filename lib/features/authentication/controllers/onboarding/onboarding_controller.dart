import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // Instantiated in OnboardingScreen
  static OnboardingController get instance => Get.find();

  // Variables
  final pageIndex = 0.obs;
  final pageController = PageController();

  // Methods

  // Update current page index on scroll
  void updatePageIndex(int index) => pageIndex.value = index;



  // Update current page index on next page

  // Update current page index on skip

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

}