import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({
    super.key,
    this.foregroundColor = GColors.black,
    this.padding = const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
  });

  final Color foregroundColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          // Icon
          // TODO: change change icon based on location type, e.g. Home, Office
          // Icon(Icons.location_on, color: foregroundColor, size: GSizes.iconSm),
          FaIcon(FontAwesomeIcons.locationDot, color: foregroundColor, size: GSizes.iconSm),

          const SizedBox(width: GSizes.spaceBtwItems / 2),

          // General Location: Home, Office or Pin Code
          Text(
            "Home",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: foregroundColor),
          ),

          const SizedBox(width: GSizes.spaceBtwItems / 2),

          // Suggest location Or Display Location
          Flexible(
            child: Text(
              "Ama Colony, Vin Building, Delhi, India - 110001",
              style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: foregroundColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
