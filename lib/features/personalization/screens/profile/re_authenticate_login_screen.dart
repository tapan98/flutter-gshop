import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/features/personalization/controllers/user/user_controller.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/validators/input_validator.dart';

class ReAuthenticateLoginScreen extends StatelessWidget {
  const ReAuthenticateLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: GAppBar(
        title: Text(GTexts.verify.capitalize!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Form(
            key: controller.reAuthenticateFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email
                TextFormField(
                  controller: controller.verifyEmailController,
                  validator: Validator.validateEmail,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: GTexts.email),
                ),
                const SizedBox(height: GSizes.spaceBtwInputFields),

                // Password
                Obx(
                      () => TextFormField(
                    controller: controller.verifyPasswordController,
                    validator: (value) =>
                        Validator.validateEmptyText(GTexts.password, value),
                    obscureText: controller.hidePassword.value,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: GTexts.password,
                      suffixIcon: IconButton(
                        onPressed: controller.hidePassword.toggle,
                        icon: FaIcon(
                          controller.hidePassword.value
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: GSizes.spaceBtwSections),

                // Verify Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        controller.reAuthenticateEmailAndPasswordAndDelete(),
                    child: Text(GTexts.verify.capitalize!),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
