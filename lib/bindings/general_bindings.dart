import 'package:get/get.dart';
import 'package:gshop/data/repositories/user_repository.dart';
import 'package:gshop/util/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(UserRepository());
  }
}