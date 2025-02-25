import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/device_utils/device_utility.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CategoryAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CategoryAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return GAppBar(
      showBackArrow: false,
      title: const Text("All Categories"),
      centerTitle: false,
      actions: [
        // Search Button
        TextButton(
          // TODO: Navigate to search screen
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: GSizes.iconMd,
                color: isDark ? GColors.white : GColors.black,
              ),
              const SizedBox(width: GSizes.spaceBtwItems / 2),
              Text("Search", style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
