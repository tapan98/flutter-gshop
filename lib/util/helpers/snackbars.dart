import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gshop/util/constants/colors.dart';

class GSnackBar {
  static void successSnackBar({
    required String title,
    String message = '',
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      colorText: GColors.white,
      backgroundColor: GColors.success,
      snackPosition: SnackPosition.BOTTOM,
      duration: duration,
      icon: const FaIcon(FontAwesomeIcons.circleCheck, color: GColors.white),
    );
  }

  static void warningSnackBar({
    required String title,
    String message = '',
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      colorText: GColors.white,
      backgroundColor: GColors.warning,
      snackPosition: SnackPosition.BOTTOM,
      duration: duration,
      icon: const FaIcon(FontAwesomeIcons.circleExclamation, color: GColors.white),
    );
  }

  static void errorSnackBar({
    required String title,
    String message = '',
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      colorText: GColors.white,
      backgroundColor: GColors.error,
      snackPosition: SnackPosition.BOTTOM,
      duration: duration,
      icon: const FaIcon(FontAwesomeIcons.circleExclamation, color: GColors.white),
    );
  }

  GSnackBar._();
}
