import 'package:get/get.dart';
import 'package:gshop/bindings/general_bindings.dart';
import 'package:gshop/data/repositories/brands_repository.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/snackbars.dart';
import 'package:gshop/util/logger/logger.dart';

import '../models/brand_model.dart';

/// Instantiated in [GeneralBindings]
///
/// Communicates with [BrandsRepository]
class BrandsController extends GetxController {
  static BrandsController get instance => Get.find();

  // Data
  final _brandsRepository = Get.put(BrandsRepository());
  final Map<String, BrandModel> _brandsCache = {};


  Future<BrandModel?> fetchBrandById(String brandId) async {
    Log.debug("Fetching brand title by ID: $brandId...");
    try {
      if (brandId.isEmpty) {
        Log.error("Brand ID: $brandId is empty");
        return null;
      }
      
      if (_brandsCache.containsKey(brandId)) {
        return _brandsCache[brandId];
      }
      
      final BrandModel? brand = await _brandsRepository.getBrandById(brandId);

      if (brand != null) {
        _brandsCache[brandId] = brand;
      }

      return brand;

    } catch (e) {
      GSnackBar.errorSnackBar(
          title: GTexts.errorSnackBarTitle, message: e.toString());
      return null;
    }
  }
}
