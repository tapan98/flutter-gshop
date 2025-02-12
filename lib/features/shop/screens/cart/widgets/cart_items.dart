import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/products/cart/cart_item.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Column(
          children: [
            const CartItem(showAddRemoveButton: true),
          ],
        );
      },
      itemCount: 1,
      separatorBuilder: (_, __) => HelperFunctions.spaceBtwSectionsHeight(),
      shrinkWrap: true,
    );
  }
}
