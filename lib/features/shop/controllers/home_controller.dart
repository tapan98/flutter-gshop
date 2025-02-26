import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gshop/data/repositories/promo_repository.dart';
import 'package:gshop/features/shop/models/promo_model.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in PromoSlider
class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final RxInt carouselCurrentIndex = 0.obs;
  final carouselController = PageController();
  final RxList<PromoModel> promos = <PromoModel>[].obs;
  final _promoRepository = Get.put(PromoRepository());
  final RxBool isLoading = false.obs;

  // Methods

  void updateCarouselCurrentIndex(int index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> fetchPromos() async {
    try {
      isLoading.value = true;

      promos.value = await _promoRepository.getPromos();

      isLoading.value = false;

    } catch (e) {
      isLoading.value = false;

      GSnackBar.errorSnackBar(
        title: GTexts.errorSnackBarTitle,
        message: e.toString(),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchPromos();
  }

  @override
  void onClose() {
    Log.debug("Disposing carouselController...");
    carouselController.dispose();
    super.onClose();
  }
}
