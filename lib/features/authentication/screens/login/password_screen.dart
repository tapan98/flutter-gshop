import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/features/authentication/screens/login/widgets/login_header.dart';
import 'package:gshop/navigation_menu.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import '../password_reset/forgot_password_screen.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const GAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              const LoginHeader(),

              // User's Email text
              Text("some@email.com",
                  style: Theme.of(context).textTheme.labelLarge),

              // Password Input Form
              Padding(
                padding: const EdgeInsets.symmetric(vertical: GSizes.spaceBtwSections),
                child: Form(
                  child: Column(
                    children: [
                      // Password Input
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: GTexts.password,
                        ),
                      ),

                      // Forgot Password Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () =>
                                Get.to(() => const ForgotPasswordScreen()),
                            child: const Text(
                              GTexts.forgotPassword,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),

                      HelperFunctions.spaceBtwItemsHeight(),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          // TODO: Login on pressed
                          onPressed: () => Get.offAll(() => const NavigationMenu()),
                          child: const Text(GTexts.signIn),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
