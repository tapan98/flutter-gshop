import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/common/widgets/authentication/form_divider.dart';
import 'package:gshop/common/widgets/authentication/social_buttons.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import 'widgets/create_account_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HelperFunctions.setDynamicStatusBarTheme(context);
    return Scaffold(
      appBar: GAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
              Text(GTexts.createAccountTitle, style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: GSizes.spaceBtwSections),

              // Create Account Form
              CreateAccountForm(),

              const SizedBox(height: GSizes.spaceBtwSections),

              // Footer
              FormDivider(text: GTexts.orSignInWith),

              const SizedBox(height: GSizes.spaceBtwSections),

              SocialButtons(),

            ],
          ),
        ),
      ),
    );
  }
}
