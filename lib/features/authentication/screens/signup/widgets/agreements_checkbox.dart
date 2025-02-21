import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/authentication/controllers/signup/signup_controller.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/text_strings.dart';

class AgreementsCheckbox extends StatelessWidget {
  const AgreementsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        // Checkbox
        Obx(
          () => Checkbox(
            value: controller.agreementsCheck.value,
            // TODO: Add onChanged
            onChanged: (value) =>
                (value != null) ? controller.agreementsCheck.value = value : null,
          ),
        ),

        // Privacy Policy & Terms of Use text
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                // By creating...
                TextSpan(
                  text: GTexts.byCreatingAnAccountYouAgreeToOur,
                  style: Theme.of(context).textTheme.bodySmall,
                ),

                // Privacy policy
                TextSpan(
                  text: GTexts.privacyPolicy,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // TODO: Open Privacy Policy
                    },
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: GColors.primary,
                      ),
                ),

                // and
                TextSpan(
                  text: " ${GTexts.and} ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),

                // Terms of Use
                TextSpan(
                  text: GTexts.termsOfUse,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // TODO: Open Privacy Policy
                    },
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: GColors.primary,
                      ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
