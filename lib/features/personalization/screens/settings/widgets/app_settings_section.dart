import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/personalization/screens/settings/widgets/settings_theme_choice.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import 'settings_menu_tile.dart';

class AppSettingsSection extends StatelessWidget {
  const AppSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---- App Settings ----
        const SectionHeading(
          title: GTexts.appSettings,
          padding: EdgeInsets.zero,
        ),

        HelperFunctions.spaceBtwItemsHeight(),

        // App Theme Color
        SettingsMenuTile(
          icon: const FaIcon(
            FontAwesomeIcons.palette,
            color: GColors.primary,
          ),
          title: GTexts.colorSchemeTitle,
          subtitle: GTexts.colorSchemeSubtitle,
          onTap: () {
            HelperFunctions.dialog(
              context,
              const SettingsThemeChoice(),
            );
          },
        )
      ],
    );
  }
}
