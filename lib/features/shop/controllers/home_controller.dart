import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in PromoSlider
class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final RxInt carouselCurrentIndex = 0.obs;
  final carouselController = PageController();

  void updateCarouselCurrentIndex(int index) {
    carouselCurrentIndex.value = index;
  }

  @override
  void onClose() {
    Log.debug("Disposing carouselController...");
    carouselController.dispose();
    super.onClose();
  }
}
