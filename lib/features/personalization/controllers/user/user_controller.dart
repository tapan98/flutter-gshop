import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/bindings/general_bindings.dart';
import 'package:gshop/common/widgets/animation/fullscreen_loading.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/data/repositories/user_repository.dart';
import 'package:gshop/features/authentication/models/user_model.dart';
import 'package:gshop/features/authentication/screens/login/login_screen.dart';
import 'package:gshop/features/personalization/screens/profile/re_authenticate_login_screen.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/network_manager.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';
import 'package:image_picker/image_picker.dart';

/// Deals with fetching and storing user data
///
/// Communicates with [UserRepository]
/// to fetch user details
///
/// Instantiated in [GeneralBindings]
class UserController extends GetxController {
  static UserController get instance => Get.find();

  // Data
  final Rx<UserModel> user = UserModel.empty().obs;
  final reAuthenticateFormKey = GlobalKey<FormState>();
  final verifyEmailController = TextEditingController();
  final verifyPasswordController = TextEditingController();
  final hidePassword = true.obs;

  /// Indicates if the user profile
  /// is being loaded from Firestore Database
  final RxBool profileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Methods

  Future<void> reAuthenticateEmailAndPasswordAndDelete() async {
    try {
      FullScreenLoadingAnimation.startLoading(
        Get.context!,
        GImages.processingDocerAnimation,
        "${GTexts.processing}...",
      );

      // Check network
      if (!await NetworkManager.instance.isConnected()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      // Validate form
      if (!reAuthenticateFormKey.currentState!.validate()) {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        return;
      }

      // Re-Authenticate User
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
        email: verifyEmailController.text.trim(),
        password: verifyPasswordController.text.trim(),
      );

      // get current profile picture url to delete
      final photoUrl =
          AuthenticationRepository.instance.getCurrentUser?.photoURL;

      // Delete User
      AuthenticationRepository.instance.deleteAccount();

      // Delete Profile Picture
      if (photoUrl == null) {
        Log.debug("No photo url found for the current user");
      } else {
        // delete profile picture from Firebase Storage
        await UserRepository.instance.deleteObjectFromStorage(photoUrl);
      }
      AuthenticationRepository.instance.logout();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoadingAnimation.stopLoading(Get.context!);
      GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle, message: e.toString());
    }
  }

  /// Shows a warning popup to the user,
  /// prompting user to either cancel or continue deleting their account
  void deleteAccountPopup() {
    // Show warning dialog
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(GSizes.md),
      title: GTexts.deleteAccount,
      middleText: GTexts.deleteAccountWarningText,
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        onPressed: _deleteUserAccount,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: GSizes.lg),
          child: Text(GTexts.delete.capitalize!),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: Navigator.of(Get.overlayContext!).pop,
        child: Text(GTexts.cancel.capitalize!),
      ),
    );
  }

  /// Checks the current authenticated user provider.
  ///
  /// ** On sign in with google provider **
  /// If it is a google sign in provider,
  /// then it calls [AuthenticationRepository]'s
  /// [signInWithGoogle] method, when no exception is caused
  /// (meaning successful re-authentication),
  /// this method proceeds to delete user account
  /// along with their profile picture
  ///
  /// ** On Sign in with Email and Password provider **
  /// It redirects the screen to [ReAuthenticateLoginScreen],
  /// there, the user is prompted to re-authenticate
  /// using their email & password, upon successful re-authentication,
  /// the account is deleted along with their uploaded profile picture
  Future<void> _deleteUserAccount() async {
    try {
      FullScreenLoadingAnimation.startLoading(
        Get.context!,
        GImages.processingDocerAnimation,
        GTexts.deletingAccount,
      );

      // Re-Authenticate User
      final auth = AuthenticationRepository.instance;
      final String provider =
          auth.getCurrentUser?.providerData.first.providerId ?? "";

      if (provider.isEmpty) {
        Log.error("provider was empty!");
        return;
      }

      if (provider == 'google.com') {
        await auth.signInWithGoogle();
        // get current profile picture url to delete later
        final photoUrl =
            AuthenticationRepository.instance.getCurrentUser?.photoURL;
        await auth.deleteAccount();
        // Delete Profile Picture
        if (photoUrl == null) {
          Log.debug("No photo url found for the current user");
        } else {
          // delete profile picture from Firebase Storage
          await UserRepository.instance
              .deleteObjectFromStorageWithoutThrowingException(photoUrl);
        }
        await auth.logout();
        Get.offAll(() => const LoginScreen());
      } else if (provider == 'password') {
        FullScreenLoadingAnimation.stopLoading(Get.context!);
        Get.off(() => const ReAuthenticateLoginScreen());
      }
    } catch (e) {
      FullScreenLoadingAnimation.stopLoading(Get.context!);
      GSnackBar.errorSnackBar(
        title: GTexts.errorSnackBarTitle,
        message: e.toString(),
      );
    }
  }

  String getProfilePictureUrl() {
    return AuthenticationRepository.instance.getCurrentUser?.photoURL ?? "";
  }

  Future<void> fetchUserRecord() async {
    Log.debug("Fetching user details from UserRepository...");
    profileLoading.value = true;
    try {
      user.value = await UserRepository.instance.fetchUserDetails();
    } catch (e) {
      Log.error(e);
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> updateProfilePicture() async {
    profileLoading.value = true;
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
      );

      if (image == null) return;

      Log.info('Uploading image: ${image.path}');
      final String? oldImageUrl =
          AuthenticationRepository.instance.getCurrentUser!.photoURL;

      final String newImageUrl =
          await UserRepository.instance.uploadImageToFirebaseStorage(image);

      // Update profile image url in FirebaseAuth
      await AuthenticationRepository.instance.getCurrentUser!
          .updatePhotoURL(newImageUrl);

      // Delete previous image from Firebase Storage
      if (oldImageUrl != null) {
        await UserRepository.instance.deleteObjectFromStorage(oldImageUrl);
      }
    } catch (e) {
      Log.error(e);
    } finally {
      profileLoading.value = false;
    }
  }
}
