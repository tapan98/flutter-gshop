import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/controllers/brands_controller.dart';
import 'package:gshop/features/shop/models/brand_model.dart';
import 'package:gshop/util/constants/firebase_constants.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/exceptions/firebase_exceptions.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in [BrandsController]
///
/// Fetches Brand details from [FirebaseFirestore]
class BrandsRepository extends GetxController {
  static BrandsRepository get instance => Get.find();

  // Data
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Methods
  Future<BrandModel?> getBrandById(String brandId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection(FirestoreCollections.brandsCollection)
          .doc(brandId)
          .get();

      final BrandModel brand = BrandModel.fromDocumentSnapshot(snapshot);
      return brand;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } catch (e) {
      Log.debug(e);
      throw GTexts.couldNotLoadBrandName;
    }
  }
}
