import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/styles/padding_styles.dart';
import 'package:gshop/common/widgets/authentication/form_divider.dart';
import 'package:gshop/common/widgets/authentication/social_buttons.dart';
import 'package:gshop/features/authentication/controllers/login/login_controller.dart';
import 'package:gshop/features/authentication/screens/login/widgets/login_form.dart';
import 'package:gshop/features/authentication/screens/login/widgets/login_header.dart';
import 'package:gshop/features/authentication/screens/signup/signup_screen.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
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
            const LoginForm(),

            const SizedBox(height: GSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(GTexts.createAccount),
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
