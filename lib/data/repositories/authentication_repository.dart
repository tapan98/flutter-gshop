import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gshop/features/authentication/screens/login/login_screen.dart';
import 'package:gshop/features/authentication/screens/onboarding/onboarding_screen.dart';

/// Instantiated in main.dart
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();

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

  @override
  void onReady() async {
    await screenRedirect();
    FlutterNativeSplash.remove();
  }

  // Constants
  static const String isFirstTime = "isFirstTime";
}
