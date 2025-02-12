import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/util/constants/sizes.dart';

import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        showBackArrow: false,
        title: Text("My Cart"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(GSizes.defaultSpace),
        child: CartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
        child: ElevatedButton(onPressed: (){}, child: Text("Checkout ₹71,000")),
      ),
    );
  }
}
