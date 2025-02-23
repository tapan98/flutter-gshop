import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/authentication/models/user_model.dart';
import 'package:gshop/features/personalization/controllers/user/user_controller.dart';
import 'package:gshop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:gshop/features/personalization/screens/profile/widgets/profile_picture_widget.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final UserModel user = userController.user.value;
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
                value: user.firstName,
                // TODO: Navigate to editor screen
                onTap: () {},
              ),

              // Last Name
              ProfileMenu(
                title: GTexts.lastName,
                value: user.lastName,
                // TODO: Navigate to editor screen
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
                value: user.phoneNumber,
                onTap: () {},
              ),

              // Email ID
              ProfileMenu(
                title: GTexts.email,
                value: user.email,
                onTap: () {},
              ),

              const SizedBox(height: GSizes.spaceBtwSections / 2),
              const Divider(),
              const SizedBox(height: GSizes.spaceBtwSections / 2),


              // Delete Account Button
              TextButton(
                onPressed: userController.deleteAccountPopup,
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
