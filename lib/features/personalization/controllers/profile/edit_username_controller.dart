import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/animation/fullscreen_loading.dart';
import 'package:gshop/data/repositories/user_repository.dart';
import 'package:gshop/features/authentication/models/user_model.dart';
import 'package:gshop/features/personalization/controllers/user/user_controller.dart';
import 'package:gshop/features/personalization/screens/profile/profile_screen.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/network_manager.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

class EditUsernameController extends GetxController {
  // Data
  final formKey = GlobalKey<FormState>();
  final usernameTextController = TextEditingController();

  // Methods
  Future<void> updateUsername() async {
    try {
      FullScreenLoadingAnimation.startLoading(
        Get.context!,
        GImages.processingDocerAnimation,
        "${GTexts.processing}...",
      );

      if (!await NetworkManager.instance.isConnected()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      if (!formKey.currentState!.validate()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      if (!await UserRepository.instance
          .isUsernameUnique(usernameTextController.text.trim())) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        GSnackBar.errorSnackBar(
          title: GTexts.sorry.capitalize!,
          message: GTexts.usernameIsAlreadyTaken,
        );
        return;
      }

      // Data for firestore
      final Map<String, dynamic> data = {
        UserModel.usernameKey: usernameTextController.text.trim(),
      };

      // Update username
      Log.debug("Updating username...");
      await UserRepository.instance.updateUserDetails(data);
      UserController.instance.fetchUserRecord();
      FullScreenLoadingAnimation.stopLoading(Get.context!);
      Get.off(() => const ProfileScreen());
      GSnackBar.successSnackBar(
        title: GTexts.success.capitalize!,
        message: GTexts.usernameUpdatedSuccessfully,
      );
    } catch (e) {
      FullScreenLoadingAnimation.stopLoading(Get.context!);
      GSnackBar.errorSnackBar(
        title: GTexts.errorSnackBarTitle,
        message: e.toString(),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    usernameTextController.text = UserController.instance.user.value.username;
  }

  @override
  void onClose() {
    Log.debug("Disposing usernameTextController...");
    usernameTextController.dispose();
    super.onClose();
  }
}
