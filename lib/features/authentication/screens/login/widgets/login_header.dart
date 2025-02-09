import 'package:flutter/material.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        Image(
            height: 100,
            image: AssetImage( isDark ? GImages.lightAppLogo : GImages.orangeAppLogo)),

        // Title
        Text(GTexts.welcomeTitle, style: Theme.of(context).textTheme.headlineMedium),
        // Subtitle
        Text(GTexts.welcomeSubtitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
