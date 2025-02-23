import 'package:flutter/material.dart';
import 'package:gshop/features/authentication/controllers/login/login_controller.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Sign-in
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: GColors.grey)),
          child: IconButton(
            onPressed: LoginController.instance.loginWithGoogle,
            icon: const Image(
              width: GSizes.iconLg,
              height: GSizes.iconLg,
              image: AssetImage(GImages.googleIcon),
            ),
          ),
        ),
      ],
    );
  }
}
