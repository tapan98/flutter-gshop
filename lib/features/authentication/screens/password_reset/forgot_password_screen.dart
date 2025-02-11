import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/features/authentication/screens/password_reset/password_reset_screen.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headings
              Text(GTexts.forgotPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: GSizes.spaceBtwItems),
              Text(GTexts.forgotPasswordSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium),

              const SizedBox(height: GSizes.spaceBtwSections),

              // Email TextField
              Form(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: GTexts.email,
                  ),
                ),
              ),

              const SizedBox(height: GSizes.spaceBtwSections),

              // Submit Button

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // TODO: Send Verification Email
                  onPressed: () => Get.to(() => const PasswordResetScreen()),
                  child: Text(GTexts.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
