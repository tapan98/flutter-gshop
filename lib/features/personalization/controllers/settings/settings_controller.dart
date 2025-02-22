import 'package:get/get.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/snackbars.dart';

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  // Methods
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
