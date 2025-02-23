import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gshop/data/repositories/user_repository.dart';
import 'package:gshop/features/authentication/screens/login/login_screen.dart';
import 'package:gshop/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:gshop/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:gshop/home/screens/navigation_menu.dart';
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

  /// Get current authenticated user
  User? get getCurrentUser => _auth.currentUser;

  /// Decides which screen to navigate in to
  ///
  Future<void> screenRedirect() async {
    Log.debug("Deciding screen redirection...");
    // Check if user is logged in with FirebaseAuth
    _auth.currentUser?.reload();
    if (_auth.currentUser != null) {
      Log.debug("Checking user: ${_auth.currentUser}...");
      // check email verification
      if (_auth.currentUser!.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser!.email));
      }
    } else {
      Log.debug("User isn't logged in");
      // Check if app is launched for the first time
      deviceStorage.writeIfNull(isFirstTime, true);
      deviceStorage.read(isFirstTime)
          ? Get.offAll(() => const OnboardingScreen())
          : Get.offAll(() => const LoginScreen());
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
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

  Future<void> reAuthenticateWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionMessage(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionMessage(e.code).message;
    } catch (e) {
      Log.debug(e);
      throw GTexts.somethingWentWrongPleaseTryAgain;
    }
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

  /// Sends password reset email to the user
  /// if there is a user associated with [FirebaseAuth]
  ///
  /// or throws an Exception with human readable message
  Future<void> sendPasswordResetEmail(String email) async {
    Log.debug("Sending password reset email...");
    try {
      Log.debug(_auth.currentUser);
      await _auth.sendPasswordResetEmail(email: email);
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

  bool? isEmailVerified() {
    try {
      _auth.currentUser?.reload();
      return _auth.currentUser?.emailVerified;
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

  // * Federated Login *
  // Google sign in
  Future<UserCredential> signInWithGoogle() async {
    Log.debug("Signing in with Google...");
    try {
      GoogleSignInAccount? account = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await account?.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credential);
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
    Log.debug("Logging user out...");
    try {
      await GoogleSignIn().signOut();
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

  Future<void> deleteAccount() async {
    Log.debug("Deleting account...");
    try {
      final String userId = _auth.currentUser!.uid;
      await _auth.currentUser?.delete();
      await UserRepository.instance.deleteUserDetails(userId);
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
