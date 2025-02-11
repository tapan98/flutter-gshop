import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/features/authentication/screens/login/login_screen.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        showBackArrow: false,
        actions: [
          IconButton(
            // TODO: Logout
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: Icon(Icons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              // Email Sent Image
              Image.asset(
                GImages.emailDelivered,
              ),

              HelperFunctions.spaceBtwSectionsHeight(),

              // Verify Email Text
              Text(GTexts.verifyEmailTitle,
                  style: Theme.of(context).textTheme.headlineMedium),

              HelperFunctions.spaceBtwItemsHeight(),

              // User's Email
              Text("Some@email.com",
                  style: Theme.of(context).textTheme.labelLarge),

              HelperFunctions.spaceBtwItemsHeight(),

              // Verify Email Subtitle
              Text(GTexts.verifyEmailSubtitle,
                  style: Theme.of(context).textTheme.labelMedium),

              HelperFunctions.spaceBtwSectionsHeight(),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // TODO: Check email verification status
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: Text(GTexts.continueText.capitalize!),
                ),
              ),

              HelperFunctions.spaceBtwItemsHeight(),

              // Resend Email Button
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
