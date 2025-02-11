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
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: GAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              LoginHeader(),
              // Image.asset(
              //   isDark ? GImages.lightAppLogo : GImages.orangeAppLogo,
              //   height: 100,
              // ),

              // User's Email text
              Text("some@email.com",
                  style: Theme.of(context).textTheme.labelLarge),

              // Enter password Title

              // Password Input Form
              Padding(
                padding: const EdgeInsets.symmetric(vertical: GSizes.spaceBtwSections),
                child: Form(
                  child: Column(
                    children: [
                      // Password Input
                      TextFormField(
                        decoration: InputDecoration(
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
                            child: Text(
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
                          child: Text(GTexts.signIn),
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
