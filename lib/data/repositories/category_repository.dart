import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/controllers/category_controller.dart';
import 'package:gshop/features/shop/models/category_model.dart';
import 'package:gshop/util/constants/firebase_constants.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/exceptions/firebase_exceptions.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in [CategoryController]
///
/// Communicates with [FirebaseFirestore]
/// and [FirebaseStorage]
/// to retrieve various categories and images
class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Data
  final _firestore = FirebaseFirestore.instance;

  // Get all categories
  Future<List<CategoryModel>> getCategories() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection(FirestoreCollections.firebaseCategoriesCollection)
          .get();
      final List<CategoryModel> categories = snapshot.docs
          .map((category) => CategoryModel.fromDocumentSnapshot(category))
          .toList();
      return categories;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw GTexts.somethingWentWrong;
    }
  }
}
