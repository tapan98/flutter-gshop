import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/authentication/controllers/login/login_controller.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/validators/input_validator.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Form(
      key: controller.emailFormKey,
      child: Column(
        children: [
          // Email Input
          TextFormField(
            controller: controller.emailController,
            validator: (value) => Validator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: GTexts.email,
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwItems),

          // Remember Email Checkbox
          GestureDetector(
            onTap: () => controller.rememberEmailCheckbox.toggle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Checkbox(
                    value: controller.rememberEmailCheckbox.value,
                    onChanged: (value) =>
                        controller.rememberEmailCheckbox.value = value ?? false,
                  ),
                ),
                const Text(
                  GTexts.rememberEmail,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwItems),

          // Continue Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.checkEmail,
              child: Text(GTexts.continueText.capitalize!),
            ),
          )
        ],
      ),
    );
  }
}
