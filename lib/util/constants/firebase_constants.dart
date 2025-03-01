class FirestoreCollections {
  // ============== Top-level collections ==============
  static const String firestoreUsersCollection = "Users";
  static const String firebaseCategoriesCollection = "Categories";
  static const String firebasePromosCollection = "PromoBanners";
  static const String firebaseProductsCollection = "Products";

  // ==============  Sub-collections ==============
  static const String firebaseSubCategoriesCollectionString = "SubCategories";
  static const String firebaseSubCategoryItemsCollectionString = "SubCategoryItems";


  FirestoreCollections._();
}

class FirebaseStoragePaths {
  static final String firebaseStorageUsersProfilePicturesPath =
      "${FirestoreCollections.firestoreUsersCollection}/ProfilePictures/";

  FirebaseStoragePaths._();
}