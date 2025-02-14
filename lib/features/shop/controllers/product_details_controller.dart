import 'package:get/get.dart';

/// Instantiated in ProductDetailsImagesSlider
class ProductDetailsController extends GetxController {
  final RxInt imageIndex = 0.obs;

  void updateCurrentIndex(int index) => imageIndex.value = index;
}
