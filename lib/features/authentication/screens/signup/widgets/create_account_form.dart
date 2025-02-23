import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gshop/features/authentication/controllers/signup/signup_controller.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/validators/input_validator.dart';

import 'agreements_checkbox.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          // First & Last Name
          Row(
            children: [
              // First Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstNameTextController,
                  validator: (value) =>
                      Validator.validateEmptyText(GTexts.firstName, value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: GTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(width: GSizes.spaceBtwInputFields),

              // Last Name
              Expanded(
                child: TextFormField(
                  controller: controller.lastNameTextController,
                  validator: (value) =>
                      Validator.validateEmptyText(GTexts.firstName, value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: GTexts.lastName,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: GSizes.spaceBtwInputFields),

          // Username
          TextFormField(
            controller: controller.usernameTextController,
            validator: (value) =>
                Validator.validateEmptyText(GTexts.username, value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.perm_identity),
              labelText: GTexts.username,
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: controller.emailTextController,
            validator: (value) => Validator.validateEmail(value),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: GTexts.email,
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            controller: controller.phoneNumberTextController,
            validator: (value) => Validator.validatePhoneNumber(value),
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: GTexts.phoneNumber,
            ),
          ),


          // Password
          Obx(
            () => Column(
              children: [
                const SizedBox(height: GSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.passwordTextController,
                  validator: (value) => Validator.validatePassword(value),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.obscurePassword.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    labelText: GTexts.password,
                    suffixIcon: IconButton(
                      onPressed: controller.togglePasswordVisibility,
                      icon: controller.obscurePassword.value
                          ? const FaIcon(FontAwesomeIcons.eye)
                          : const FaIcon(FontAwesomeIcons.eyeSlash),
                    ),
                  ),
                ),

                const SizedBox(height: GSizes.spaceBtwInputFields),

                // Re-enter Password
                if (controller.obscurePassword.value)
                  TextFormField(
                    controller: controller.reEnterPasswordTextController,
                    validator: (value) {
                      // Validate only when password is being Re-entered
                      if (controller.obscurePassword.value) {
                        return Validator.validateReEnterPassword(
                            controller.passwordTextController.text, value);
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      labelText: GTexts.reEnterPassword,
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwSections),

          // Agreement Checkbox
          const AgreementsCheckbox(),

          const SizedBox(height: GSizes.spaceBtwSections),

          // Create Account Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.createAccount,
              child: const Text(GTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
