import 'package:get/get.dart';
import 'package:gshop/data/repositories/products_repository.dart';
import 'package:gshop/data/repositories/user_repository.dart';
import 'package:gshop/features/personalization/controllers/user/user_controller.dart';
import 'package:gshop/features/shop/controllers/brands_controller.dart';
import 'package:gshop/util/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(UserRepository());
    Get.put(UserController());
    Get.put(ProductsRepository());
    Get.put(BrandsController());
  }
}