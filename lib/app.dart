import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:gshop/util/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: GTheme.lightTheme,
      darkTheme: GTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}
