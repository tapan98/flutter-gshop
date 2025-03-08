import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/controllers/home_controller.dart';
import 'package:gshop/features/shop/models/promo_model.dart';
import 'package:gshop/util/constants/firebase_constants.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/exceptions/firebase_exceptions.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in [HomeController]
///
/// fetches a list of promo banner images from [FirebaseFirestore]
class PromoRepository extends GetxController {
  static PromoRepository get instance => Get.find();

  // Data
  final _firestore = FirebaseFirestore.instance;

  // Get all promo banners
  Future<List<PromoModel>> getPromos() async {
    try {
      final snapshot = await _firestore
          .collection(FirestoreCollections.promosCollection)
          .get();

      final List<PromoModel> promos = snapshot.docs
          .map((promo) => PromoModel.fromDocumentSnapshot(promo))
          .toList();
      return promos;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw GTexts.somethingWentWrong;
    }
  }
}
