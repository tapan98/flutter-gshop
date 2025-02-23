import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/bindings/general_bindings.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/theme/theme.dart';

import '../controllers/theme_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
        themeMode: controller.themeMode.value,
        theme: GTheme.lightTheme,
        darkTheme: GTheme.darkTheme,
        initialBinding: GeneralBindings(),
        // Loading screen while app is initializing
        home: const Scaffold(
          backgroundColor: GColors.primary,
          body: Center(child: CircularProgressIndicator(color: GColors.white)),
        ),
      ),
    );
  }
}

