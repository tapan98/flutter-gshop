import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/authentication/screens/onboarding/onboarding_screen.dart';
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
        home: const OnboardingScreen(),
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
