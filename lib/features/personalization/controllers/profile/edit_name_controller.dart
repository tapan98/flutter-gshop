import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/animation/fullscreen_loading.dart';
import 'package:gshop/data/repositories/user_repository.dart';
import 'package:gshop/features/authentication/models/user_model.dart';
import 'package:gshop/features/personalization/controllers/user/user_controller.dart';
import 'package:gshop/features/personalization/screens/profile/edit_name_screen.dart';
import 'package:gshop/features/personalization/screens/profile/profile_screen.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/network_manager.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in [EditNameScreen]
class EditNameController extends GetxController {
  // Data
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Methods
  Future<void> updateName() async {
    try {
      FullScreenLoadingAnimation.startLoading(
        Get.context!,
        GImages.processingDocerAnimation,
        "${GTexts.processing.capitalize!}...",
      );

      // Check network connection
      if (!await NetworkManager.instance.isConnected()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      // Validate form
      if (!formKey.currentState!.validate()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      // Transform data for Firestore Database
      Map<String, dynamic> firstAndLastNames = {
        UserModel.firstNameKey: firstNameTextController.text.trim(),
        UserModel.lastNameKey: lastNameTextController.text.trim(),
      };

      // update names
      await UserRepository.instance.updateUserDetails(firstAndLastNames);
      UserController.instance.fetchUserRecord();
      FullScreenLoadingAnimation.stopLoading(Get.context!);
      GSnackBar.successSnackBar(
        title: GTexts.success.capitalize!,
        message: GTexts.nameUpdatedSuccessfully,
      );
      Get.off(() => const ProfileScreen());
    } catch (e) {
      Log.error(e);
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
    firstNameTextController.text = UserController.instance.user.value.firstName;
    lastNameTextController.text = UserController.instance.user.value.lastName;
  }

  @override
  void onClose() {
    Log.debug("Disposing first & last name text controllers...");
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    super.onClose();
    
  }
}
