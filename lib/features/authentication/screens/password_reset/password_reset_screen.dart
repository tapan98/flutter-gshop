import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';
import 'package:gshop/util/logger/logger.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ForgotPasswordController.instance;
    if (controller.emailController.text.isEmpty) {
      Log.warning("Password reset email is empty!");
    }
    HelperFunctions.setDynamicStatusBarTheme(context);
    return Scaffold(
      appBar: const GAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              // Email Delivered Image
              Image.asset(
                GImages.emailDelivered,
                width: HelperFunctions.screenWidth(context),
              ),

              HelperFunctions.spaceBtwSectionsHeight(),

              // Email Text
              Text(controller.emailController.text,
                  style: Theme.of(context).textTheme.labelLarge),

              HelperFunctions.spaceBtwItemsHeight(),

              // Email sent subtitle
              Text(GTexts.passwordResetLinkSent,
                  style: Theme.of(context).textTheme.headlineMedium),

              HelperFunctions.spaceBtwSectionsHeight(),

              // Done Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: AuthenticationRepository.instance.screenRedirect,
                  child: Text(GTexts.done.capitalize!),
                ),
              ),

              HelperFunctions.spaceBtwItemsHeight(),

              // Resend
              TextButton(
                onPressed: () => controller.resendPasswordResetEmail(controller.emailController.text),
                child: Text(GTexts.resendEmail.capitalize!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
