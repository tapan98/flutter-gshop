import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';

import 'agreements_checkbox.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // First & Last Name
          Row(
            children: [
              // First Name
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: GTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(width: GSizes.spaceBtwInputFields),

              // Last Name
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
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
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.perm_identity),
              labelText: GTexts.username,
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: GTexts.email,
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: GTexts.phoneNumber,
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            // TODO: Toggle obscure text
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.password),
              labelText: GTexts.password,
              suffixIcon: Icon(Icons.visibility),
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwInputFields),

          // Re-enter Password
          // TODO: Hide Input Field on password visibility
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            // TODO: Toggle obscure text
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.password),
              labelText: GTexts.reEnterPassword,
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwSections),

          // Agreement Checkbox
          AgreementsCheckbox(),

          const SizedBox(height: GSizes.spaceBtwSections),

          // Create Account Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              // TODO: Create Account
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: Text(GTexts.createAccount),
            ),
          ),


        ],
      ),
    );
  }
}
