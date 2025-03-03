import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:gshop/common/widgets/custom_shapes/container/search_bar.dart';
import 'package:gshop/features/shop/screens/home/widgets/address_bar.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/device_utils/device_utility.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryHeaderContainer(
      child: Column(
        children: [
          SizedBox(height: DeviceUtils.getAppBarHeight()),
          const AddressBar(foregroundColor: GColors.black),
          HelperFunctions.spaceBtwItemsHeight(),
          const GSearchBar(text: "Search for Products"),
        ],
      ),
    );
  }
}
