import 'package:get/get.dart';
import 'package:gshop/common/widgets/animation/fullscreen_loading.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/features/authentication/models/user_model.dart';
import 'package:gshop/features/personalization/controllers/user/user_controller.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

// Instantiated in SettingsScreen
class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  // Methods

  // Get profile picture
  String? getProfilePicture() {
    return AuthenticationRepository.instance.getCurrentUser?.photoURL ?? "";
  }

  String getHeaderText() {
    final UserModel user = UserController.instance.user.value;
    Log.debug("Getting header text for user: ${user.toString()}");
    if (user.firstName.isNotEmpty) {
      return "${GTexts.hello}, ${user.firstName}";
    } else if (user.username.isNotEmpty) {
      return "${GTexts.hello}, ${user.username}";
    }

    return user.email;
  }

  Future<void> logout() async {
    try {
      FullScreenLoadingAnimation.startLoading(
        Get.context!,
        GImages.processingDocerAnimation,
        GTexts.loggingYouOut,
      );
      // Logout from Firebase
      await AuthenticationRepository.instance.logout();

      FullScreenLoadingAnimation.stopLoading(Get.context!);

      // Redirect Screen
      await AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoadingAnimation.stopLoading(Get.context!);
      GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle, message: e.toString());
    }
  }
}
