import 'package:get/get.dart';
import 'package:gshop/data/repositories/user_repository.dart';
import 'package:gshop/features/authentication/models/user_model.dart';
import 'package:gshop/util/logger/logger.dart';

/// Deals with fetching and storing user data
///
/// Communicates with [UserRepository]
/// to fetch user details
class UserController extends GetxController {
  static UserController get instance => Get.find();

  // Data
  final Rx<UserModel> user = UserModel.empty().obs;

  /// Indicates if the user profile
  /// is being loaded from Firestore Database
  final RxBool profileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Methods
  Future<void> fetchUserRecord() async {
    profileLoading.value = true;
    try {
      user(await UserRepository.instance.fetchUserDetails());
    } catch (e) {
      Log.error(e);
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }
}
