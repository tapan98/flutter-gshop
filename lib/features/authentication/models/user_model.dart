import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  static UserModel empty() => UserModel(
        userId: "",
        username: "",
        email: "",
        firstName: "",
        lastName: "",
        phoneNumber: "",
      );

  Map<String, dynamic> toMap() {
    return {
      firstNameKey: firstName,
      lastNameKey: lastName,
      usernameKey: username,
      emailKey: email,
      phoneKey: phoneNumber,
    };
  }

  /// Creates UserModel from a Firebase document snapshot
  factory UserModel.fromFirestoreDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      userId: document.id,
      firstName: data[firstNameKey] ?? "",
      lastName: data[lastNameKey] ?? "",
      username: data[usernameKey] ?? "",
      email: data[emailKey] ?? "",
      phoneNumber: data[phoneKey] ?? "",
    );
  }

  @override
  String toString() {
    return 'UserModel(userId: $userId, username: $username, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber)';
  } // Constants

  static const String firstNameKey = "FirstName";
  static const String lastNameKey = "LastName";
  static const String emailKey = "Email";
  static const String phoneKey = "PhoneNumber";
  static const String usernameKey = "Username";
}
