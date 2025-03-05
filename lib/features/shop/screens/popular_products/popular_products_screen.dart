import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/common/widgets/layouts/products_grid_layout.dart';
import 'package:gshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:gshop/features/shop/controllers/products_controller.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';

class PopularProductsScreen extends StatelessWidget {
  const PopularProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = ProductsController.instance;
    return Scaffold(
      appBar: const GAppBar(title: Text(GTexts.popularProducts)),
      body: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: ProductGridLayout(
          itemCount: productsController.popularProductIds.length,
          itemBuilder: (_, index) => ProductCardVertical(
            productId: productsController.popularProductIds[index],
          ),
        ),
      ),
    );
  }
}
