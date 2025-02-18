import 'package:flutter/material.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class NameAndAddressText extends StatelessWidget {
  const NameAndAddressText({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name and Address Type (e.g. Home, Work)
        Row(
          children: [
            // Name
            Text("Tapan",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.start),
            HelperFunctions.spaceBtwItemsWidth(),
            // Address Type
            Text(
              "Home",
              style: Theme.of(context).textTheme.titleMedium?.apply(
                    color: isDark
                        ? GColors.white.withValues(alpha: 0.5)
                        : GColors.black.withValues(alpha: 0.5),
                  ),
            ),
          ],
        ),

        HelperFunctions.spaceBtwItemsHeight(),

        // ---- Address lines ----
        // Building #, Building Name
        const Text("House No. 43"),
        // Street, Locality
        const Text("Lodhi Rd, Lodhi Gardens, Lodhi Estate"),
        // City, State & Pin code
        const Text("New Delhi, Delhi 110003"),
        // Contact Number
        const Text("+91 99999 99999")
      ],
    );
  }
}
