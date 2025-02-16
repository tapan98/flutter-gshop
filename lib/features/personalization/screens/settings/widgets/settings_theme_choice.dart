import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/app.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';

class SettingsThemeChoice extends StatelessWidget {
  const SettingsThemeChoice({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController.instance;
    return Padding(
      padding: const EdgeInsets.all(GSizes.defaultSpace),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Color Scheme",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Divider(),
          for (ThemeMode option in themeController.options)
            Obx(
              () => RadioListTile<ThemeMode>(
                title: Text(getString(option)),
                value: option,
                groupValue: themeController.themeMode.value,
                activeColor: GColors.primary,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    themeController.themeMode.value = value;
                    Navigator.pop(context);
                  }
                },
              ),
            ),
        ],
      ),
    );
  }

  static String getString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return GTexts.system;
      case ThemeMode.light:
        return GTexts.light;
      case ThemeMode.dark:
        return GTexts.dark;
    }
  }
}
