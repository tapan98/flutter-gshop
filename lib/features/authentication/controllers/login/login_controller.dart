import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/animation/fullscreen_loading.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/data/repositories/user_repository.dart';
import 'package:gshop/features/authentication/models/user_model.dart';
import 'package:gshop/features/authentication/screens/login/password_screen.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/network_manager.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/local_storage/local_storage.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in LoginScreen
class LoginController extends GetxController {
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

  /// Federated Sign-in with Google
  Future<void> loginWithGoogle() async {
    try {
      FullScreenLoadingAnimation.startLoading(
        Get.context!,
        GImages.processingDocerAnimation,
        GTexts.signingInWithGoogle,
      );

      if (!await NetworkManager.instance.isConnected()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      // Trigger sign in
      UserCredential userCredential =
      await AuthenticationRepository.instance.signInWithGoogle();


      // Save user to Firestore Database
      final user = userCredential.user;
      if (user == null) {
        Log.error("userCredential.user was null!");
        throw GTexts.somethingWentWrong;
      }

      Log.debug("Saving user record...");

      // check if user is already registered
      final userId = userCredential.user?.uid;
      if (userId != null && await UserRepository.instance.isUserIdRegistered(userId)) {
        Log.debug("User is already registered. Skipping...");
        AuthenticationRepository.instance.screenRedirect();
        return;
      }

      final newUser = UserModel(
        userId: user.uid,
        username: UserRepository.generateUsername(user.displayName ?? ''),
        email: user.email ?? '',
        firstName: UserRepository.getFirstName(user.displayName ?? ''),
        lastName: UserRepository.getLastName(user.displayName ?? ''),
        phoneNumber: user.phoneNumber ?? '',
      );

      await UserRepository.instance.saveUserRecord(newUser);

      FullScreenLoadingAnimation.stopLoading(Get.context!);

      // redirect
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
