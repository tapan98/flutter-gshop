import 'package:flutter/material.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/device_utils/device_utility.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    super.key,
    required this.text,
    required this.lottieAnimation,
    this.showButton = false,
    this.buttonText,
    this.onPressed,
  });

  final String text, lottieAnimation;
  final bool showButton;
  final String? buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        // Animation
        Lottie.asset(
          lottieAnimation,
          width: DeviceUtils.getScreenWidth(context) * 0.8,
        ),

        const SizedBox(height: GSizes.defaultSpace),

        // Text
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),

        // Button
        if (showButton)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: GSizes.defaultSpace),
              OutlinedButton(
                onPressed: onPressed,
                child: Text(
                  buttonText ?? "",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          )
      ],
    );
  }
}
