import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/screens/home/home_screen.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

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
              icon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.view_list),
              label: "Categories",
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "Account",
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
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.purple),
  ];
}
