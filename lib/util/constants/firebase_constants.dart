class FirestoreCollections {
  static const String firestoreUsersCollection = "Users";
  static const String firebaseCategoriesCollection = "Categories";
  static const String firebasePromosCollection = "PromoBanners";
}

class FirebaseStoragePaths {
  static final String firebaseStorageUsersProfilePicturesPath =
      "${FirestoreCollections.firestoreUsersCollection}/ProfilePictures/";
}