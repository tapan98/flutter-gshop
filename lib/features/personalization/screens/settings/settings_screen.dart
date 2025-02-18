import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import 'widgets/account_settings_section.dart';
import 'widgets/app_settings_section.dart';
import 'widgets/settings_header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HelperFunctions.setDynamicStatusBarTheme(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(GSizes.defaultSpace),
            child: Column(
              children: [
                const SettingsHeader(),

                HelperFunctions.spaceBtwSectionsHeight(),

                const AccountSettingsSection(),

                const SizedBox(height: GSizes.spaceBtwSections / 2),

                const SizedBox(height: GSizes.spaceBtwSections / 2),

                const AppSettingsSection(),

                HelperFunctions.spaceBtwSectionsHeight(),

                // Logout Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    // TODO: logout the user
                    onPressed: () {},
                    child: Text(GTexts.logout.capitalize!),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
