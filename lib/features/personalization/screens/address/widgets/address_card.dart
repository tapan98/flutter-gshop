import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/common/widgets/custom_shapes/container/rounded_corner_container.dart';
import 'package:gshop/common/widgets/texts/name_and_address_text.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return RoundedCornerContainer(
      backgroundColor: isDark ? GColors.darkerGrey : GColors.grey,
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(GSizes.defaultSpace),
            child: NameAndAddressText(),
          ),

          // Options Button
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              // TODO: Show popup to select between edit and remove address
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.ellipsisVertical,
                  color: isDark ? GColors.white : GColors.black, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
