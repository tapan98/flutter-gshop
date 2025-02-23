import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/animation/fullscreen_loading.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/data/repositories/user_repository.dart';
import 'package:gshop/features/authentication/models/user_model.dart';
import 'package:gshop/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/network_manager.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

class SignupController extends GetxController {
  /// Instantiated in CreateAccountForm
  ///
  /// Communicates with [AuthenticationRepository]
  /// to create accounts and sign in
  static SignupController get instance => Get.find();

  // Variables
  final formKey = GlobalKey<FormState>();
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneNumberTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final reEnterPasswordTextController = TextEditingController();
  final obscurePassword = true.obs;
  final agreementsCheck = false.obs;

  // Methods

  /// Creates an account:
  /// 1. Validates the form
  /// 2. Saves the user to the Firestore
  /// 3. Navigates to the VerifyEmailScreen
  Future<void> createAccountWithEmailAndPassword() async {
    try {
      // Start full screen loading
      FullScreenLoadingAnimation.startLoading(
        Get.context!,
        GImages.processingDocerAnimation,
        "${GTexts.signingYouUp}...",
      );

      // Check Internet
      if (!await NetworkManager.instance.isConnected()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      // Validate Form
      if (!formKey.currentState!.validate()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      // Agreements check
      if (!agreementsCheck.value) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        GSnackBar.warningSnackBar(
          title: GTexts.pleaseAcceptAgreementsTitle,
          message: GTexts.pleaseAcceptAgreementsSubtitle,
        );
        return;
      }

      // Create Account using Firebase Authenticator
      // & Save save user data in Firestore Database
      final UserCredential userCredential = await AuthenticationRepository
          .instance
          .createAccountWithEmailAndPassword(emailTextController.text.trim(),
              passwordTextController.text.trim());

      // Save User to Firestore
      if (userCredential.user != null) {
        final newUser = UserModel(
          userId: userCredential.user!.uid,
          username: usernameTextController.text.trim(),
          email: emailTextController.text.trim(),
          firstName: firstNameTextController.text.trim(),
          lastName: lastNameTextController.text.trim(),
          phoneNumber: phoneNumberTextController.text.trim(),
        );
        await UserRepository.instance.saveUserRecord(newUser);
        UserRepository.instance.fetchUserDetails();
      } else {
        Log.error("userCredential.user was null!");
        throw "Something went wrong!";
      }

      GSnackBar.successSnackBar(
        title: GTexts.accountCreated,
        message: GTexts.accountCreatedSubtitle,
      );

      FullScreenLoadingAnimation.stopLoading(Get.context!);

      Get.to(() => VerifyEmailScreen(email: emailTextController.text.trim()));
    } catch (e) {
      FullScreenLoadingAnimation.stopLoading(Get.context!);
      // Show human readable error message
      GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle, message: e.toString());
    }
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }
}
