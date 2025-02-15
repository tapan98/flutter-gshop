import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Get profile screen controller
    // final controller = ProfileScreenController.instance;

    return Container(
      padding: EdgeInsets.all(GSizes.defaultSpace),
      decoration: BoxDecoration(
        border: Border.all(color: GColors.primary),
        borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Hello, Anuj", style: Theme.of(context).textTheme.titleMedium),
          IconButton(
            // TODO: Route to Edit profile screen
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.userPen, size: GSizes.iconSm),
          )
        ],
      ),
    );
  }
}
