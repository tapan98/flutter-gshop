import 'package:flutter/material.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Email TextFormField
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: GTexts.email,
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwInputFields),

          // Password TextFormField
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.password),
              labelText: GTexts.password,
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwInputFields),

          // Remember Me checkbox & Forgot Password button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember me checkbox
              GestureDetector(
                // TODO: toggle checkbox
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: true,
                      // TODO: toggle checkbox
                      onChanged: (value) {},
                    ),
                    const Text(GTexts.rememberEmail),
                  ],
                ),
              ),
              TextButton(onPressed: (){}, child: Text(GTexts.forgotPassword)),
            ],
          ),

          const SizedBox(height: GSizes.spaceBtwInputFields),

          // Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){},
              child: Text(GTexts.signIn),
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwItems),

          // Create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: (){},
              child: Text(GTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
