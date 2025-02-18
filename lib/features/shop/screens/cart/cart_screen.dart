import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/features/shop/screens/checkout/order_summary_screen.dart';
import 'package:gshop/util/constants/sizes.dart';

import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(
        showBackArrow: false,
        title: Text("My Cart"),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
        child: CartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const OrderSummaryScreen()),
          child: const Text("Checkout ₹71,000"),
        ),
      ),
    );
  }
}
