import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/success_screen/success_screen.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in [VerifyEmailScreen]
///
/// Handles email verification related tasks
/// after the user has created an account.
///
/// After instantiation, it tries to send verification email to the user,
/// and also starts a timer for auto redirect after successful verification.
///
/// Warning: It assumes [AuthenticationRepository] has already been instantiated
/// otherwise it will throw an error.
class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }

  /// To be called after the user has created an account
  ///
  /// It assumes [AuthenticationRepository] has already been instantiated
  /// otherwise it will throw an error.
  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch (e) {
      Log.error(e);
      GSnackBar.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }

  /// To be called after the user has created an account
  /// and verification email has been sent
  ///
  /// if verified, it redirects to the SuccessScreen
  ///
  /// It assumes [AuthenticationRepository] has already been instantiated
  /// otherwise it will throw an error.
  Future<void> setTimerForAutoRedirect() async {
    final duration = const Duration(seconds: 5);
    Log.debug("Starting timer to check and redirect the screen");
    Timer.periodic(duration, (timer) async {
      if (FirebaseAuth.instance.currentUser == null) {
        Log.warning("FirebaseAuth.instance.currentUser is null!");
      }
      final user = FirebaseAuth.instance.currentUser;
      await user?.reload();
      Log.debug("checking email verification...");
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            title: GTexts.emailVerifiedTitle,
            subtitle: GTexts.emailVerifiedSubtitle,
            onContinuePressed: AuthenticationRepository.instance.screenRedirect,
          ),
        );
      }
    });
  }

  /// To be called after the user has created an account
  /// and verification email has been sent
  ///
  /// Checks if the user is email verified
  /// and redirects to SuccessScreen
  ///
  /// It assumes [AuthenticationRepository] has already been instantiated
  /// otherwise it will throw an error.
  Future<void> checkEmailVerificationStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.reload();
    if (user?.emailVerified ?? false) {
      Get.off(
        () => SuccessScreen(
          title: GTexts.emailVerifiedTitle,
          subtitle: GTexts.emailVerifiedSubtitle,
          onContinuePressed: AuthenticationRepository.instance.screenRedirect,
        ),
      );
    } else {
      Log.warning("FirebaseAuth.instance.currentUser is null!");
    }
  }
}
