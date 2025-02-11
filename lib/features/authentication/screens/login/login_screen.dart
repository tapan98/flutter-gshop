import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/styles/padding_styles.dart';
import 'package:gshop/common/widgets/authentication/form_divider.dart';
import 'package:gshop/common/widgets/authentication/social_buttons.dart';
import 'package:gshop/features/authentication/screens/login/password_screen.dart';
import 'package:gshop/features/authentication/screens/login/widgets/login_header.dart';
import 'package:gshop/features/authentication/screens/signup/signup_screen.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HelperFunctions.setDynamicStatusBarTheme(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: PaddingStyles.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Welcome Title & Subtitle
            const LoginHeader(),

            HelperFunctions.spaceBtwSectionsHeight(),

            // Email Input & Continue Button
            Form(
              child: Column(
                children: [
                  // Email Input
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: GTexts.email,
                    ),
                  ),

                  const SizedBox(height: GSizes.spaceBtwItems),

                  // Remember Email Checkbox
                  GestureDetector(
                    // TODO: toggle checkbox
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: true,
                          // TODO: toggle checkbox
                          onChanged: (value) {},
                        ),
                        const Text(
                          GTexts.rememberEmail,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: GSizes.spaceBtwItems),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      // TODO: Check Email input
                      onPressed: () => Get.to(() => const PasswordScreen()),
                      child: Text(GTexts.continueText.capitalize!),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: GSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: Text(GTexts.createAccount),
              ),
            ),

            const SizedBox(height: GSizes.spaceBtwSections),

            // Footer
            const FormDivider(text: GTexts.orSignInWith),

            const SizedBox(height: GSizes.spaceBtwSections),

            // Google Sign in
            const SocialButtons(),
          ],
        ),
      ),
    ));
  }
}
