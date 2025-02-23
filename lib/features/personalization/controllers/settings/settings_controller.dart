import 'package:get/get.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/features/authentication/models/user_model.dart';
import 'package:gshop/features/personalization/controllers/user/user_controller.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/snackbars.dart';

// Instantiated in SettingsScreen
class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  // Methods

  // Get profile picture
  String? getProfilePicture() {
    return UserController.instance.user.value.profilePicture;
  }
  
  String getHeaderText(){
    final UserModel user = UserController.instance.user.value;
    if (user.firstName.isNotEmpty) {
      return "${GTexts.hello}, ${user.firstName}";
    } else if (user.username.isNotEmpty) {
      return "${GTexts.hello}, ${user.username}";
    }

    return user.email;
  }

  Future<void> logout() async {
    try {
      // Logout from Firebase
      await AuthenticationRepository.instance.logout();

      // Redirect Screen
      await AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle, message: e.toString());
    }
  }
}
