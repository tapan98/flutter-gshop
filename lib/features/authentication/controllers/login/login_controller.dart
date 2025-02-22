import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/animation/fullscreen_loading.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/data/repositories/user_repository.dart';
import 'package:gshop/features/authentication/screens/login/password_screen.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/network_manager.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/local_storage/local_storage.dart';
import 'package:gshop/util/logger/logger.dart';

class LoginController extends GetxController {
  /// Instantiated in LoginScreen
  static LoginController get instance => Get.find();

  // Variables
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final rememberEmailCheckbox = false.obs;
  final passwordController = TextEditingController();
  final obscurePasswordText = true.obs;

  // Methods

  /// Checks if email is registered
  Future<void> checkEmail() async {
    try {
      FullScreenLoadingAnimation.startLoading(
        Get.context!,
        GImages.processingDocerAnimation,
        GTexts.checkingEmail,
      );

      // check internet
      if (!await NetworkManager.instance.isConnected()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      // validate email text field
      if (!emailFormKey.currentState!.validate()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      // Check if email is registered
      if (!await UserRepository.instance
          .isEmailRegistered(emailController.text.trim())) {
        Log.debug("Checking email: ${emailController.text.trim()}");
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        GSnackBar.errorSnackBar(
            title: GTexts.errorSnackBarTitle,
            message: GTexts.emailIsNotRegistered);
        return;
      }

      // Save email to local Storage if remember email checkbox is checked
      if (rememberEmailCheckbox.value) {
        LocalStorage()
            .saveData(emailLocalStorageKey, emailController.text.trim());
      } else {
        LocalStorage().removeData(emailLocalStorageKey);
      }

      // redirect to password screen
      FullScreenLoadingAnimation.stopLoading(Get.context!);
      Get.to(() => const PasswordScreen());
    } catch (e) {
      FullScreenLoadingAnimation.stopLoading(Get.context!);
      GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle, message: e.toString());
    }
  }

  Future<void> login() async {
    try {
      // Loading screen
      FullScreenLoadingAnimation.startLoading(
        Get.context!,
        GImages.processingDocerAnimation,
        GTexts.loggingYouIn,
      );

      // Check network
      if (!await NetworkManager.instance.isConnected()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      // Validate Form
      if (!passwordFormKey.currentState!.validate()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      // Login with Email & Password using firebase
      await AuthenticationRepository.instance.signInWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      // Stop Loading screen
      FullScreenLoadingAnimation.stopLoading(Get.context!);

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoadingAnimation.stopLoading(Get.context!);
      GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle, message: e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    final String? email = LocalStorage().readData(emailLocalStorageKey);
    if (email != null) {
      emailController.text = email;
      rememberEmailCheckbox.value = true;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Constants
  static const emailLocalStorageKey = "rememberedEmail";
}
