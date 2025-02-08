import 'package:flutter/material.dart';
import 'package:gshop/features/authentication/screens/onboarding_screen.dart';
import 'package:gshop/util/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: GTheme.lightTheme,
      darkTheme: GTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}
