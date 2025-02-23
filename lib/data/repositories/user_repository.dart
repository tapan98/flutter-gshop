import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gshop/features/authentication/models/user_model.dart';
import 'package:gshop/util/exceptions/firebase_exceptions.dart';
import 'package:gshop/util/logger/logger.dart';

/// Instantiated in general_bindings.dart
///
/// Communicates with [FirebaseFirestore]
/// to store and retrieve user data
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // Variables
  /// [FirebaseFirestore] instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Methods

  /// Save user data to Firestore
  ///
  /// or throws an exception with human readable message
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _firestore
          .collection(_firestoreUsersCollection)
          .doc(user.userId)
          .set(user.toMap());
    } on FirebaseException catch (e) {
      throw FirebaseExceptionMessage(e.code).message;
    } catch (e) {
      Log.error(e);
      throw "Something went wrong trying to save user data!";
    }
  }

  Future<bool> isEmailRegistered(String email) async {
    try {
      // check if email exists in Firestore Database
      final querySnapshot = await _firestore
          .collection(_firestoreUsersCollection)
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

  // Generate username
  static String generateUsername(String fullName) {

    List<String> nameParts = fullName.split(' ');

    String firstName = nameParts.first;

    String userName = "${firstName}_${DateTime.now().millisecondsSinceEpoch}";

    return userName;
  }

  // ** Get first & last name **
  // First name
  static String getFirstName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    return nameParts.first;
  }
  // Last name
  static String getLastName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    return nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
  }

  // Constants
  static const String _firestoreUsersCollection = "Users";
}
