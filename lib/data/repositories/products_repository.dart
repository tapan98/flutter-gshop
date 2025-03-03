import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gshop/bindings/general_bindings.dart';
import 'package:gshop/features/shop/models/popular_products_model.dart';
import 'package:gshop/features/shop/models/product_model.dart';
import 'package:gshop/features/shop/models/product_variant_model.dart';
import 'package:gshop/util/constants/firebase_constants.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/exceptions/firebase_exceptions.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in [GeneralBindings]
///
/// Communicates with [FirebaseFirestore] to fetch product details
class ProductsRepository extends GetxController {
  static ProductsRepository get instance => Get.find();

  // =============== Data ===============
  final _firestore = FirebaseFirestore.instance;

  /// Returns [ProductModel] with the given [productId] (Firestore document's Id)
  ///
  /// Returns [null] if no product is found
  Future<ProductModel?> getProductById(String productId) async {
    Log.debug("Fetching product by id: $productId...");
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection(FirestoreCollections.firebaseProductsCollection)
          .doc(productId)
          .get();

      if (snapshot.data() == null) {
        Log.error("No product found with id: $productId");
        return null;
      }

      final ProductModel product = ProductModel.fromDocumentSnapshot(snapshot);
      return product;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw GTexts.somethingWentWrong;
    }
  }

  /// Returns [ProductModel] with the given [sku] (looks for [sku] in variants list)
  ///
  /// Returns [null] if no product is found
  Future<ProductModel?> getProductBySku(String sku) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection(FirestoreCollections.firebaseProductsCollection)
          .where(ProductModel.variantsKey,
              arrayContains: {ProductVariantModel.variantSkuKey: sku}).get();

      if (snapshot.docs.isEmpty) {
        return null;
      }

      final QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          snapshot.docs.first;

      final product = ProductModel.fromDocumentSnapshot(documentSnapshot);
      return product;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw GTexts.somethingWentWrong;
    }
  }

  Future<List<String>> getPopularProductIds() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection(FirestoreCollections.firebasePopularProductsCollection)
          .get();

      if (snapshot.docs.isEmpty) {
        return [];
      }

      final List<String> popularProductIds = snapshot.docs.map((doc) {
        return doc.data()[PopularProductsModel.productIdKey] as String;
      }).toList();
      return popularProductIds;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw GTexts.somethingWentWrong;
    }
  }
}
