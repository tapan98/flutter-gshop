import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/animation/fullscreen_loading.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/data/repositories/user_repository.dart';
import 'package:gshop/features/authentication/screens/password_reset/password_reset_screen.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/network_manager.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in [ForgotPasswordScreen]
class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  //Variables
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  // Methods
  Future<void> sendPasswordResetEmail() async {
    try {
      // Loading screen
      FullScreenLoadingAnimation.startLoading(
        Get.context!,
        GImages.processingDocerAnimation,
        GTexts.sendingPasswordResetEmail,
      );

      // Check network
      if (!await NetworkManager.instance.isConnected()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      // Validate email
      if (!formKey.currentState!.validate()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        GSnackBar.errorSnackBar(
            title: GTexts.errorSnackBarTitle, message: GTexts.invalidEmail);
        return;
      }

      // Check if email is registered
      if (!await UserRepository.instance.isEmailRegistered(
          emailController.text.trim())) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        GSnackBar.errorSnackBar(title: GTexts.errorSnackBarTitle,
            message: GTexts.emailIsNotRegistered);
        return;
      }

      // Send password reset email
      AuthenticationRepository.instance.sendPasswordResetEmail(emailController.text.trim());

      // stop loading
      FullScreenLoadingAnimation.stopLoading(Get.context!);

      // redirect
      Get.to(() => const PasswordResetScreen());
    } catch (e) {
      FullScreenLoadingAnimation.stopLoading(Get.context!);
      GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle, message: e.toString());
    }
  }

  Future<void> resendPasswordResetEmail(String email) async {
    try {
      FullScreenLoadingAnimation.startLoading(
        Get.context!, GImages.processingDocerAnimation,
        GTexts.sendingPasswordResetEmail,);

      if (email.isEmpty) {
        GSnackBar.errorSnackBar(title: GTexts.errorSnackBarTitle, message: GTexts.somethingWentWrong);
        Log.error("Email was empty!");
        Get.offAll(() => AuthenticationRepository.instance.screenRedirect());
      }
      
      // Check network
      if (!await NetworkManager.instance.isConnected()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }
      
      // resend email
      await AuthenticationRepository.instance.sendPasswordResetEmail(emailController.text.trim());
      
      FullScreenLoadingAnimation.stopLoading(Get.context!);
    } catch (e) {
      FullScreenLoadingAnimation.stopLoading(Get.context!);
      GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle, message: e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    Log.debug("Disposing emailController...");
    emailController.dispose();
  }
}
