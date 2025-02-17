import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/custom_shapes/container/search_bar.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class OrderAppbarWidget extends StatelessWidget {
  const OrderAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return SliverAppBar(
      leading: IconButton(
        onPressed: Get.back,
        icon: Icon(
          Icons.keyboard_arrow_left,
          color: isDark ? GColors.white : GColors.black,
        ),
      ),
      floating: true,
      pinned: true,
      toolbarHeight: 70,
      title: Text(GTexts.myOrders),
      bottom: PreferredSize(
        preferredSize:
            const Size.fromHeight(GSizes.appBarHeight + GSizes.defaultSpace),
        child: Padding(
          padding: const EdgeInsets.only(
            left: GSizes.defaultSpace,
            right: GSizes.defaultSpace,
            bottom: GSizes.defaultSpace,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Search
              Flexible(
                child: GSearchBar(
                  text: GTexts.searchOrders,
                  inputField: true,
                  height: 50,
                  padding: EdgeInsets.zero,
                ),
              ),

              const SizedBox(width: GSizes.spaceBtwItems/2),

              // Filter
              TextButton(
                // TODO: bottom sheet filter list
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.filter_list,
                      size: GSizes.iconMd,
                      color: isDark ? GColors.white : GColors.black,
                    ),
                    const SizedBox(width: GSizes.spaceBtwItems / 2),
                    Text(
                      GTexts.filters.capitalize!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
