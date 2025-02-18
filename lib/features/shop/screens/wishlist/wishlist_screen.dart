import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/common/widgets/layouts/grid_layout.dart';
import 'package:gshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(title: Text(GTexts.wishlist.capitalize!)),
      body: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: ProductGridLayout(
          itemCount: 4,
          itemBuilder: (context, index) => const ProductCardVertical(
            imageUrl: GImages.product1,
            productTitle: "Samsung Galaxy S24 Ultra",
            productRating: "4.3",
          ),
        ),
      ),
    );
  }
}
