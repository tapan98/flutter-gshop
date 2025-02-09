import 'package:flutter/material.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title, subtitle, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(GSizes.defaultSpace),
      child: Column(
        children: [
          // Image
          Image(
              image: AssetImage(image),
              height: HelperFunctions.screenHeight(context) * 0.6),

          // Title
          Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium),

          SizedBox(height: GSizes.spaceBtwItems),

          // Subtitle
          Text(subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
