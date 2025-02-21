
import 'package:gshop/util/constants/text_strings.dart';

class Validator {

  static String? validateEmptyText(String? fieldName, String? value) {
    
    if (value == null || value.isEmpty) {
      return '$fieldName ${GTexts.isRequired}';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '${GTexts.email} ${GTexts.isRequired}';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return GTexts.invalidEmail;
    }

    return null;
  }

  static String? validatePassword(String? value) {

    if (value == null || value.isEmpty) {
      return '${GTexts.password} ${GTexts.isRequired}';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return '${GTexts.passwordMustBeAtLeast} 6 ${GTexts.charactersLong}';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return GTexts.passwordMustContainAtLeastOneUppercase;
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return GTexts.passwordMustContainAtLeastOneNumber;
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return GTexts.passwordMustContainAtLeastOneSpecial;
    }

    return null;
  }

  static String? validateReEnterPassword(String? password, String? reEnteredPassword) {
    if (reEnteredPassword == null || reEnteredPassword.isEmpty) {
      return GTexts.pleaseReEnterPassword;
    }

    if (password != reEnteredPassword) {
      return GTexts.passwordsDoNotMatch;
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return '${GTexts.phoneNumber} ${GTexts.isRequired}';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return '${GTexts.invalidPhoneNumberFormat} (10 ${GTexts.digitsRequired}).';
    }

    return null;
  }
  Validator._();
}
