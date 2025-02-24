import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/personalization/controllers/user/user_controller.dart';
import 'package:gshop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:gshop/features/personalization/screens/profile/widgets/profile_picture_widget.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import 'edit_name_screen.dart';
import 'edit_username_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
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

              // Display Name
              Obx(
                () => ProfileMenu(
                  title: GTexts.fullName,
                  value: userController.user.value.fullName,
                  onTap: () => Get.to(() => const EditNameScreen()),
                ),
              ),

              // Username
              Obx(
                () => ProfileMenu(
                  title: GTexts.username,
                  value: userController.user.value.username,
                  onTap: () => Get.to(() => const EditUsernameScreen()),
                ),
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
                value: userController.user.value.phoneNumber,
                onTap: () {},
              ),

              // Email ID
              ProfileMenu(
                title: GTexts.email,
                value: userController.user.value.email,
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
