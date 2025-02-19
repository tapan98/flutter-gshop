import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gshop/features/personalization/screens/profile/profile_screen.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(GSizes.defaultSpace),
      decoration: BoxDecoration(
        border: Border.all(color: GColors.primary),
        borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Image
          const CircleAvatar(
            backgroundImage: AssetImage(GImages.dummyPersonImage),
          ),
          HelperFunctions.spaceBtwItemsWidth(),
          Text("Hello, Tapan", style: Theme.of(context).textTheme.titleMedium),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () => Get.to(() => const ProfileScreen()),
            icon: const FaIcon(FontAwesomeIcons.userPen, size: GSizes.iconSm),
          )
        ],
      ),
    );
  }
}
