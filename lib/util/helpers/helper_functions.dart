import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/sizes.dart';

class HelperFunctions {
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null;
    }
  }

  static SizedBox spaceBtwItemsHeight() {
    return const SizedBox(height: GSizes.spaceBtwItems);
  }

  static SizedBox spaceBtwItemsWidth() {
    return const SizedBox(width: GSizes.spaceBtwItems);
  }

  static SizedBox spaceBtwSectionsHeight() {
    return const SizedBox(height: GSizes.spaceBtwSections);
  }

  static SizedBox spaceBtwSectionsWidth() {
    return const SizedBox(width: GSizes.spaceBtwSections);
  }

  static SizedBox spaceBtwInputFieldsHeight() {
    return const SizedBox(height: GSizes.spaceBtwInputFields);
  }

  static SizedBox spaceBtwInputFieldsWidth() {
    return const SizedBox(width: GSizes.spaceBtwInputFields);
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static void setDynamicStatusBarTheme(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarBrightness: Theme.of(context).brightness,
      statusBarIconBrightness:
          isDarkMode(context) ? Brightness.light : Brightness.dark,
    ));
  }

  static void dialog(BuildContext context, Widget child) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: child,
      ),
    );
  }

  HelperFunctions._();
}
