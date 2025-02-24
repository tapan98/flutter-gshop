import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/features/authentication/models/user_model.dart';
import 'package:gshop/util/constants/firebase_constants.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/exceptions/firebase_auth_exceptions.dart';
import 'package:gshop/util/exceptions/firebase_exceptions.dart';
import 'package:gshop/util/exceptions/platform_exceptions.dart';
import 'package:gshop/util/logger/logger.dart';
import 'package:image_picker/image_picker.dart';

/// Instantiated in general_bindings.dart
///
/// Communicates with [AuthenticationRepository],
/// [FirebaseFirestore] and [FirebaseStorage]
/// to store and retrieve user data
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // Variables
  /// [FirebaseFirestore] instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Methods

  /// Updates the user details in Firestore Database
  ///
  /// Re-throws known exceptions with a human readable message,
  /// else logs the unexpected exception and throws a generic error message
  Future<void> updateUserDetails(Map<String, dynamic> data) async {
    Log.debug("Updating user details...");
    try {
      final User? user = AuthenticationRepository.instance.getCurrentUser;
      if (user == null) {
        throw "Current user isn't authenticated!";
      }

      await _firestore
          .collection(FirestoreCollections.firestoreUsersCollection)
          .doc(user.uid)
          .update(data);
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw GTexts.somethingWentWrong;
    }
  }

  Future<UserModel> fetchUserDetails() async {
    Log.debug("Fetching current user details from Firestore...");
    try {
      final User? user = AuthenticationRepository.instance.getCurrentUser;

      if (user == null) {
        Log.error("User is null");
        throw GTexts.somethingWentWrongPleaseTryAgain;
      }

      user.reload();

      final DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection(FirestoreCollections.firestoreUsersCollection)
          .doc(user.uid)
          .get();

      if (!snapshot.exists) {
        Log.error("User document does not exist");
        throw GTexts.somethingWentWrongPleaseTryAgain;
      }
      return UserModel.fromFirestoreDocumentSnapshot(snapshot);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionMessage(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionMessage(e.code).message;
    } catch (e) {
      Log.debug(e);
      throw GTexts.somethingWentWrongPleaseTryAgain;
    }
  }

  /// Save user data to Firestore
  ///
  /// or throws an exception with human readable message
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _firestore
          .collection(FirestoreCollections.firestoreUsersCollection)
          .doc(user.userId)
          .set(user.toMap());
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw "Something went wrong trying to save user data!";
    }
  }

  Future<bool> isUserIdRegistered(String userId) async {
    try {
      final documentSnapshot = await _firestore
          .collection(FirestoreCollections.firestoreUsersCollection)
          .doc(userId)
          .get();

      return documentSnapshot.exists;
    } catch (e) {
      Log.error(e);
      throw GTexts.somethingWentWrong;
    }
  }

  Future<bool> isEmailRegistered(String email) async {
    try {
      // check if email exists in Firestore Database
      final querySnapshot = await _firestore
          .collection(FirestoreCollections.firestoreUsersCollection)
          .where(UserModel.emailKey, isEqualTo: email)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw "Something went wrong trying to save user data!";
    }
  }

  Future<bool> isUsernameUnique(String username) async {
    Log.debug("Checking if username $username is unique...");
    try {
      // check if username exists in Firestore Database
      final querySnapshot = await _firestore
          .collection(FirestoreCollections.firestoreUsersCollection)
          .where(UserModel.usernameKey, isEqualTo: username)
          .get();
      return querySnapshot.docs.isEmpty;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw GTexts.somethingWentWrong;
    }
  }

  /// Deletes the object with the given url
  /// from [FirebaseStorage].
  ///
  /// Rethrows known exceptions with a human readable message,
  /// else, logs the unexpected exception
  /// and throws a generic "Something went wrong" message
  Future<void> deleteObjectFromStorage(String url) async {
    Log.debug("Deleting $url...");
    try {
      FirebaseStorage.instance.refFromURL(url).delete();
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw GTexts.somethingWentWrong;
    }
  }

  /// Tries the delete the object with the given url
  ///
  /// If the url doesn't exist it will simply log an error.
  ///
  /// Useful on a scenario when the url object couldn't be deleted
  /// for some reason (e.g. url doesn't exist in Storage)
  /// and the execution flow should not be stopped simple because
  /// the [FirebaseStorage] threw an exception
  Future<void> deleteObjectFromStorageWithoutThrowingException(
      String url) async {
    Log.debug("Deleting $url...");
    try {
      FirebaseStorage.instance.refFromURL(url).delete();
    } catch (e) {
      Log.error(e);
    }
  }

  Future<String> uploadImageToFirebaseStorage(XFile image) async {
    try {
      // Upload image
      final ref = FirebaseStorage.instance
          .ref(FirebaseStoragePaths.firebaseStorageUsersProfilePicturesPath)
          .child(image.name);
      Log.debug("Uploading image...");
      await ref.putFile(File(image.path));

      Log.debug("Getting image download url...");
      final photoURL = await ref.getDownloadURL();

      return photoURL;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw GTexts.somethingWentWrong;
    }
  }

  Future<void> deleteUserDetails(String userId) async {
    Log.debug("Deleting user details from Firestore Database...");
    try {
      // Delete user document from Firestore
      await _firestore
          .collection(FirestoreCollections.firestoreUsersCollection)
          .doc(userId)
          .delete();
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } on PlatformException catch (e) {
      throw PlatformExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw GTexts.somethingWentWrong;
    }
  }

  // ** Static methods **

  // Generate username
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(' ');

    String firstName = nameParts.first;

    String userName = "${firstName}_${DateTime.now().millisecondsSinceEpoch}";

    Log.debug("Generated username: $userName");
    return userName;
  }

  // ** Get first & last name **
  // First name
  static String getFirstName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    if (nameParts.isNotEmpty) {
      return nameParts.first;
    }
    return "";
  }

  // Last name
  static String getLastName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    return nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
  }
}
