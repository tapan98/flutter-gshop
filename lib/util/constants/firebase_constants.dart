class FirestoreCollections {
  // ============== Top-level collections ==============
  static const String usersCollection = "Users";
  static const String categoriesCollection = "Categories";
  static const String promosCollection = "PromoBanners";
  static const String productsCollection = "Products";
  static const String popularProductsCollection = "PopularProducts";
  static const String brandsCollection = "Brands";

  // ==============  Sub-collections ==============
  static const String subCategoriesCollectionString = "SubCategories";
  static const String subCategoryItemsCollectionString = "SubCategoryItems";


  FirestoreCollections._();
}

class FirebaseStoragePaths {
  static final String firebaseStorageUsersProfilePicturesPath =
      "${FirestoreCollections.usersCollection}/ProfilePictures/";

  FirebaseStoragePaths._();
}