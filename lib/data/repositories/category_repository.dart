import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/controllers/category_controller.dart';
import 'package:gshop/features/shop/models/category_model.dart';
import 'package:gshop/features/shop/models/sub_category_item_model.dart';
import 'package:gshop/features/shop/models/sub_category_model.dart';
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

  // Get sub categories
  Future<List<SubCategoryModel>> getSubCategories(String categoryId) async {
    try {
      // Get Sub category documents
      final QuerySnapshot<Map<String, dynamic>> subCategorySnapshot =
          await _firestore
              .collection(FirestoreCollections.firebaseCategoriesCollection)
              .doc(categoryId)
              .collection(
                  FirestoreCollections.firebaseSubCategoriesCollectionString)
              .get();

      // Create a list of SubCategoryModel from documents
      final List<SubCategoryModel> subCategories = subCategorySnapshot.docs
          .map((doc) => SubCategoryModel.fromDocumentSnapshot(doc))
          .toList();

      // Fetch SubCategoryItems for each SubCategory
      for (final subCategory in subCategories) {
        final QuerySnapshot<Map<String, dynamic>> subCategoryItemsSnapshot =
            await _firestore
                .collection(FirestoreCollections
                    .firebaseCategoriesCollection) // in categories collection
                .doc(categoryId) // in category document
                .collection(FirestoreCollections
                    .firebaseSubCategoriesCollectionString) // in subcategories collection
                .doc(subCategory.id) // in sub category document
                .collection(FirestoreCollections
                    .firebaseSubCategoryItemsCollectionString) // in sub category items collection
                .get(); // get sub category items

        // Create a list of SubCategoryItemModel
        final List<SubCategoryItemModel> subCategoryItems =
            subCategoryItemsSnapshot.docs
                .map((doc) => SubCategoryItemModel.fromDocumentSnapshot(doc))
                .toList();

        // Add sub category items to sub category
        subCategory.items.addAll(subCategoryItems);
      }

      // return sub categories
      return subCategories;

    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw GTexts.somethingWentWrong;
    }
  }
}
