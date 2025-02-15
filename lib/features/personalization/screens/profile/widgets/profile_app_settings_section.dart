import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/personalization/screens/profile/widgets/profile_menu_tile.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class ProfileAppSettingsSection extends StatelessWidget {
  const ProfileAppSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---- App Settings ----
        SectionHeading(
          title: GTexts.appSettings,
          padding: EdgeInsets.zero,
        ),

        HelperFunctions.spaceBtwItemsHeight(),

        // App Theme Color
        ProfileMenuTile(
          icon: FaIcon(
            FontAwesomeIcons.palette,
            color: GColors.primary,
          ),
          title: GTexts.colorSchemeTitle,
          subtitle: GTexts.colorSchemeSubtitle,
          // TODO: Bottom sheet to choose between color scheme
          onTap: (){},
        )
      ],
    );
  }
}
