import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/features/shop/controllers/products_controller.dart';
import 'package:gshop/features/shop/models/product_model.dart';
import 'package:gshop/features/shop/screens/product_details/widgets/product_variant_section_widget.dart';
import 'package:gshop/util/constants/sizes.dart';

class ProductVariationsWidget extends StatefulWidget {
  const ProductVariationsWidget({super.key});

  @override
  State<ProductVariationsWidget> createState() =>
      _ProductVariationsWidgetState();
}

/// Stateful widget is used to force rebuild of the widget
/// because [Obx] doesn't rebuild widgets on deeply nested data changes
class _ProductVariationsWidgetState extends State<ProductVariationsWidget> {
  @override
  Widget build(BuildContext context) {
    final productsController = ProductsController.instance;
    final Rx<ProductModel?> product = productsController.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: product.value!
            .getAllVariantsPropertyKeys()
            .map(
              (propertyKey) => ProductVariantSectionWidget(
                productPropertyKey: propertyKey,
                propertyValues: productsController
                    .getAllVariantsPropertyValues(propertyKey),
                refresh: () => setState(() {}),
              ),
            )
            .toList(),
      ),
    );
  }
}
