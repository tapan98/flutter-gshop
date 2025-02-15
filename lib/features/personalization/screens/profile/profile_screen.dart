import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/personalization/screens/profile/widgets/profile_account_settings_section.dart';
import 'package:gshop/features/personalization/screens/profile/widgets/profile_app_settings_section.dart';
import 'package:gshop/features/personalization/screens/profile/widgets/profile_header.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HelperFunctions.setDynamicStatusBarTheme(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(GSizes.defaultSpace),
            child: Column(
              children: [
                ProfileHeader(),

                HelperFunctions.spaceBtwSectionsHeight(),

                ProfileAccountSettingsSection(),

                const SizedBox(height: GSizes.spaceBtwSections / 2),

                const SizedBox(height: GSizes.spaceBtwSections / 2),

                ProfileAppSettingsSection(),

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
