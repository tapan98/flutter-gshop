import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gshop/features/authentication/screens/login/login_screen.dart';
import 'package:gshop/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/exceptions/firebase_auth_exceptions.dart';
import 'package:gshop/util/exceptions/firebase_exceptions.dart';
import 'package:gshop/util/exceptions/platform_exceptions.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in main.dart
///
/// Communicates with [FirebaseAuth]
/// for authentication related tasks
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();

  /// Firebase Authentication instance
  final _auth = FirebaseAuth.instance;

  // Methods
  /// Decides which screen to navigate in to
  ///
  Future<void> screenRedirect() async {
    // Check if app is launched for the first time
    deviceStorage.writeIfNull(isFirstTime, true);
    deviceStorage.read(isFirstTime)
        ? Get.offAll(() => const OnboardingScreen())
        : Get.offAll(() => const LoginScreen());
  }

  /// Creates an account using Firebase Authenticator
  ///
  /// returns [UserCredential] after successful creation of accounts
  ///
  /// or throws Exceptions with human readable messages
  Future<UserCredential> createAccountWithEmailAndPassword(
      String email, String password) async {
    Log.debug("Creating account...");
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionMessage(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionMessage(e.code).message;
    } catch (e) {
      Log.debug(e);
      throw GTexts.somethingWentWrongPleaseTryAgain;
    }
  }

  /// Sends verification email to the user
  /// if there is a user associated with [FirebaseAuth]
  ///
  /// or throws an Exception with human readable message
  Future<void> sendEmailVerification() async {
    Log.debug("Sending verification email...");
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionMessage(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionMessage(e.code).message;
    } catch (e) {
      Log.debug(e);
      throw GTexts.somethingWentWrongPleaseTryAgain;
    }
  }

  Future<void> logout() async {
    try {
      // TODO: call GoogleSignIn().signOut() once google authentication is implemented
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionMessage(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionMessage(e.code).message;
    } catch (e) {
      Log.debug(e);
      throw GTexts.somethingWentWrongPleaseTryAgain;
    }
  }

  @override
  void onReady() async {
    await screenRedirect();
    FlutterNativeSplash.remove();
  }

  // Constants
  static const String isFirstTime = "isFirstTime";
}
