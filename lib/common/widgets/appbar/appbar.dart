import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/device_utils/device_utility.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class GAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GAppBar({
    super.key,
    this.showBackArrow = true,
    this.title,
    this.leading,
    this.actions,
  });

  final bool showBackArrow;
  final Widget? title, leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: GSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.keyboard_arrow_left,
                    color: isDark ? GColors.white : GColors.black))
            : leading,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
