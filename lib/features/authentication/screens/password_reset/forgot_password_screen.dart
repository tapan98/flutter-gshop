import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/validators/input_validator.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({
    super.key,
    this.email = "",
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    controller.emailController.text = email;
    return Scaffold(
      appBar: const GAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
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
                key: controller.formKey,
                child: TextFormField(
                  controller: controller.emailController,
                  validator: (value) => Validator.validateEmail(value),
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
                  onPressed: controller.sendPasswordResetEmail,
                  child: const Text(GTexts.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
