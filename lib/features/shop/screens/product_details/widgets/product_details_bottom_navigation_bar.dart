import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/screens/checkout/order_summary_screen.dart';
import 'package:gshop/util/constants/text_strings.dart';

class ProductDetailsBottomNavigationBar extends StatelessWidget {
  const ProductDetailsBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:
              TextButton(onPressed: () {}, child: const Text(GTexts.addToCart)),
        ),
        Expanded(
            child: ElevatedButton(
          onPressed: () => Get.to(() => const OrderSummaryScreen()),
          child: const Text(GTexts.buyNow),
        ))
      ],
    );
  }
}
