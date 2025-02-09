import 'package:flutter/material.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        Image(
            height: 100,
            image: AssetImage(GImages.lightAppLogo)),

        // Title
        Text(GTexts.welcomeTitle, style: Theme.of(context).textTheme.headlineMedium),
        // Subtitle
        Text(GTexts.welcomeSubtitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
