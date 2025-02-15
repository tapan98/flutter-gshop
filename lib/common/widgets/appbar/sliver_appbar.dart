import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class GSliverAppBar extends StatelessWidget {
  const GSliverAppBar({
    super.key,
    this.showBackArrow = true,
    this.floating = true,
    this.pinned = false,
    this.title,
    this.leading,
    this.actions,
  });

  final bool showBackArrow, floating, pinned;
  final Widget? title, leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: floating,
      pinned: pinned,
      leading: showBackArrow
          ? IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.keyboard_arrow_left,
                  color: isDark ? GColors.white : GColors.black))
          : leading,
      title: title,
      actions: actions,
    );
  }
}
