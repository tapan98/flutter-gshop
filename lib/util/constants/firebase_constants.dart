class FirestoreCollections {
  static const String firestoreUsersCollection = "Users";
  static const String firebaseCategoriesCollection = "Categories";
}

class FirebaseStoragePaths {
  static final String firebaseStorageUsersProfilePicturesPath =
      "${FirestoreCollections.firestoreUsersCollection}/ProfilePictures/";
}