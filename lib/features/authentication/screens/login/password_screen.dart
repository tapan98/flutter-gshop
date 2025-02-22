import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/features/authentication/controllers/login/login_controller.dart';
import 'package:gshop/features/authentication/screens/login/widgets/login_header.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';
import 'package:gshop/util/validators/input_validator.dart';

import '../password_reset/forgot_password_screen.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
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
              Text(controller.emailController.text,
                  style: Theme.of(context).textTheme.labelLarge),

              // Password Input Form
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: GSizes.spaceBtwSections),
                child: Form(
                  key: controller.passwordFormKey,
                  child: Column(
                    children: [
                      // Password Input
                      Obx(
                        () => TextFormField(
                          controller: controller.passwordController,
                          validator: (value) => Validator.validateEmptyText(
                              GTexts.password, value),
                          obscureText: controller.obscurePasswordText.value,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            labelText: GTexts.password,
                            suffixIcon: IconButton(
                              onPressed: controller.obscurePasswordText.toggle,
                              icon: controller.obscurePasswordText.value
                                  ? const FaIcon(FontAwesomeIcons.eye)
                                  : const FaIcon(FontAwesomeIcons.eyeSlash),
                            ),
                          ),
                        ),
                      ),

                      // Forgot Password Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Get.to(() => ForgotPasswordScreen(
                                  email: controller.emailController.text,
                                )),
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
                          onPressed: controller.login,
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
