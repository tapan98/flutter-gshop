import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/features/authentication/screens/login/login_screen.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

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
              // Email Delivered Image
              Image.asset(
                GImages.emailDelivered,
                width: HelperFunctions.screenWidth(context),
              ),

              HelperFunctions.spaceBtwSections(),

              // Email Text
              Text("Some@email.com",
                  style: Theme.of(context).textTheme.labelLarge),

              HelperFunctions.spaceBtwItems(),

              // Email sent subtitle
              Text(GTexts.passwordResetLinkSent,
                  style: Theme.of(context).textTheme.headlineMedium),

              HelperFunctions.spaceBtwSections(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: Text(GTexts.done.capitalize!),
                ),
              ),

              HelperFunctions.spaceBtwItems(),

              // Resend
              TextButton(
                // TODO: Resend Email
                onPressed: () {},
                child: Text(GTexts.resendEmail.capitalize!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
