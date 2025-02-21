import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/styles/padding_styles.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    this.image = GImages.successAnimation,
    required this.title,
    required this.subtitle,
    this.onContinuePressed,
    this.isLottieImage = true,
  });

  final String image, title, subtitle;
  final VoidCallback? onContinuePressed;
  final bool isLottieImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: PaddingStyles.paddingWithAppBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 50),

            // Images
            isLottieImage
                ? Lottie.asset(
                    image,
                    width: HelperFunctions.screenWidth(context) * 0.6,
                  )
                : Image.asset(
                    image,
                    width: HelperFunctions.screenWidth(context) * 0.6,
                  ),

            HelperFunctions.spaceBtwSectionsHeight(),
            // Title
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),

            HelperFunctions.spaceBtwItemsHeight(),

            // Subtitle
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),

            HelperFunctions.spaceBtwSectionsHeight(),

            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onContinuePressed,
                child: Text(GTexts.continueText.capitalize!),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
