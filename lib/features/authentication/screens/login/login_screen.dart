import 'package:flutter/material.dart';
import 'package:gshop/common/styles/padding_styles.dart';
import 'package:gshop/common/widgets/authentication/form_divider.dart';
import 'package:gshop/common/widgets/authentication/social_buttons.dart';
import 'package:gshop/features/authentication/screens/login/widgets/login_form.dart';
import 'package:gshop/features/authentication/screens/login/widgets/login_header.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';
import 'package:gshop/util/theme/theme.dart';

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

            // Form: Email, Password, Remember me, Forgot Password, Sign In & Create Account
            const Padding(
              padding:
                  EdgeInsets.symmetric(vertical: GSizes.spaceBtwSections),
              child: LoginForm(),
            ),

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
