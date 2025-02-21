import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/data/repositories/authentication_repository.dart';
import 'package:gshop/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:gshop/features/authentication/screens/login/login_screen.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';


class VerifyEmailScreen extends StatelessWidget {
  /// To be instantiated after the account has been created
  /// but email is not verified.
  ///
  /// Warning: It assumes [AuthenticationRepository] has already been
  /// instantiated, otherwise the close button from the appbar will throw an error
  ///
  /// Once instantiated, VerifyEmailController sends
  /// verification email to the current user
  /// and starts auto verification timer
  const VerifyEmailScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: GAppBar(
        showBackArrow: false,
        actions: [
          IconButton(
            onPressed: AuthenticationRepository.instance.logout,
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Text(email,
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
                  onPressed: controller.checkEmailVerificationStatus,
                  child: Text(GTexts.continueText.capitalize!),
                ),
              ),

              HelperFunctions.spaceBtwItemsHeight(),

              // Resend Email Button
              TextButton(
                onPressed: controller.sendVerificationEmail,
                child: Text(GTexts.resendEmail.capitalize!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
