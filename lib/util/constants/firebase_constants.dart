class FirestoreCollections {
  static const String firestoreUsersCollection = "Users";
  static const String firebaseCategoriesCollection = "Categories";
  static const String firebasePromosCollection = "PromoBanners";
  static const String firebaseSubCategoriesCollectionString = "SubCategories";
  static const String firebaseSubCategoryItemsCollectionString = "SubCategoryItems";
}

class FirebaseStoragePaths {
  static final String firebaseStorageUsersProfilePicturesPath =
      "${FirestoreCollections.firestoreUsersCollection}/ProfilePictures/";
}