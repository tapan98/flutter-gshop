import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/util/local_storage/local_storage.dart';

/// Instantiated in `app.dart`
class ThemeController extends GetxController {
  static ThemeController get instance => Get.find();

  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    themeMode.value =
        _themeModes[LocalStorage().readData(themeModeKey) as String?] ??
            ThemeMode.system;
  }

  Future<void> saveThemeMode() async {
    LocalStorage().saveData(themeModeKey, themeMode.value.name);
  }

  // constants
  static const String themeModeKey = "themeMode";
  static final Map<String, ThemeMode> _themeModes = {
    ThemeMode.system.name: ThemeMode.system,
    ThemeMode.light.name: ThemeMode.light,
    ThemeMode.dark.name: ThemeMode.dark,
  };
}
