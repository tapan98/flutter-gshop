import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/home/controllers/theme_controller.dart';
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
          // Title
          Text(
            GTexts.colorScheme,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const Divider(),

          // List of Theme Modes
          ...ThemeMode.values.map(
            (e) => Obx(
              () => RadioListTile<ThemeMode>(
                title: Text(e.name.capitalize!),
                value: e,
                groupValue: themeController.themeMode.value,
                activeColor: GColors.primary,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    themeController
                      ..themeMode.value = value
                      ..saveThemeMode();
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
