import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/bindings/general_bindings.dart';
import 'package:gshop/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/theme/theme.dart';

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

class ThemeController extends GetxController {
  static ThemeController get instance => Get.find();

  final RxList<ThemeMode> options = [
    ThemeMode.system,
    ThemeMode.light,
    ThemeMode.dark,
  ].obs;

  Rx<ThemeMode> themeMode = ThemeMode.system.obs;
}
