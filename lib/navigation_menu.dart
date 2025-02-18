import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/screens/cart/cart_screen.dart';
import 'package:gshop/features/shop/screens/categories/categories_screen.dart';
import 'package:gshop/features/shop/screens/home/home_screen.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import 'features/personalization/screens/settings/settings_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: isDark ? GColors.dark : GColors.light,
          indicatorColor: isDark
              ? GColors.white.withValues(alpha: 0.1)
              : GColors.black.withValues(alpha: 0.1),
          destinations: [
            NavigationDestination(
              // icon: Icon(Icons.home),
              icon: const FaIcon(FontAwesomeIcons.house),
              label: GTexts.home.capitalize!,
            ),
            NavigationDestination(
              icon: const FaIcon(FontAwesomeIcons.cubesStacked),
              label: GTexts.categories.capitalize!,
            ),
            NavigationDestination(
              icon: const FaIcon(FontAwesomeIcons.cartShopping),
              // TODO: Fetch Cart items
              label: "${GTexts.cart.capitalize!} (3)",
            ),
            NavigationDestination(
              icon: const FaIcon(FontAwesomeIcons.bars),
              label: GTexts.settings.capitalize!,
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  final List<StatelessWidget> screens = <StatelessWidget>[
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const SettingsScreen(),
  ];
}
