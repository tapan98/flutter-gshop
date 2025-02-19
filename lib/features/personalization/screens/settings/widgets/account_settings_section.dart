import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/personalization/screens/address/address_screen.dart';
import 'package:gshop/features/shop/screens/order/order_screen.dart';
import 'package:gshop/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import 'settings_menu_tile.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---- Account Settings ----
        const SectionHeading(
          title: GTexts.accountSettings,
          padding: EdgeInsets.zero,
        ),

        HelperFunctions.spaceBtwItemsHeight(),

        // Orders
        SettingsMenuTile(
          icon: const FaIcon(
            FontAwesomeIcons.boxesPacking,
            color: GColors.primary,
          ),
          title: GTexts.orders.capitalize!,
          subtitle: GTexts.ordersSubtitle,
          onTap: () => Get.to(() => const OrderScreen()),
        ),

        // WishList
        SettingsMenuTile(
          icon: const FaIcon(
            FontAwesomeIcons.solidHeart,
            color: GColors.primary,
          ),
          title: GTexts.wishlist.capitalize!,
          subtitle: GTexts.wishListSubtitle,
          onTap: () => Get.to(() => const WishlistScreen()),
        ),

        // Saved Addresses
        SettingsMenuTile(
          icon: const FaIcon(
            FontAwesomeIcons.solidAddressBook,
            color: GColors.primary,
          ),
          title: GTexts.savedAddressesTitle,
          subtitle: GTexts.savedAddressesSubtitle,
          onTap: () => Get.to(() => const AddressScreen()),
        ),

        // Payment Methods
        SettingsMenuTile(
          icon: const FaIcon(
            FontAwesomeIcons.wallet,
            color: GColors.primary,
          ),
          title: GTexts.paymentMethodsTitle,
          subtitle: GTexts.paymentMethodsSubtitle,
          // TODO: Route to Payment Methods Screen
          onTap: () {},
        ),

        // Notification Settings
        SettingsMenuTile(
          icon: const FaIcon(
            FontAwesomeIcons.solidBell,
            color: GColors.primary,
          ),
          title: GTexts.notificationSettingsTitle,
          subtitle: GTexts.notificationSettingsSubtitle,
          // TODO: Route to Notification Settings Screen
          onTap: () {},
        ),

        // Privacy Settings
        SettingsMenuTile(
          icon: const FaIcon(
            FontAwesomeIcons.shieldHalved,
            color: GColors.primary,
          ),
          title: GTexts.privacyTitle,
          subtitle: GTexts.privacySubtitle,
          // TODO: Route to Privacy Settings Screen
          onTap: () {},
        ),
      ],
    );
  }
}
