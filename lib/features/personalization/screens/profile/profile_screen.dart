import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:gshop/features/personalization/screens/profile/widgets/profile_picture_widget.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Pictures
              const ProfilePictureWidget(),

              const SizedBox(height: GSizes.spaceBtwSections / 2),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwSections / 2),

              // ---- Profile Information ---- //
              const SectionHeading(title: "Profile Information"),

              HelperFunctions.spaceBtwItemsHeight(),

              // First Name
              ProfileMenu(
                title: GTexts.firstName,
                value: "Tapan",
                onTap: () {},
              ),

              // Last Name
              ProfileMenu(
                title: GTexts.lastName,
                value: "B",
                onTap: () {},
              ),

              const SizedBox(height: GSizes.spaceBtwSections / 2),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwSections / 2),

              // ---- Personal Information ---- //
              const SectionHeading(title: "Personal Information"),

              HelperFunctions.spaceBtwItemsHeight(),

              // Mobile Number
              ProfileMenu(
                title: GTexts.phoneNumber,
                value: "+91 99999 99999",
                onTap: () {},
              ),

              // Email ID
              ProfileMenu(
                title: GTexts.email,
                value: "tapanboro98@gmail.com",
                onTap: () {},
              ),

              // Gender
              ProfileMenu(
                title: GTexts.gender,
                value: "Male",
                onTap: () {},
              ),

              const SizedBox(height: GSizes.spaceBtwSections / 2),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwSections / 2),

              // ---- Buttons ---- //
              // Deactivate Account Button
              TextButton(
                onPressed: () {},
                child: const Text(
                  GTexts.deactivateAccount,
                  style: TextStyle(color: Colors.red),
                ),
              ),

              // Delete Account Button
              TextButton(
                onPressed: () {},
                child: const Text(
                  GTexts.deleteAccount,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
