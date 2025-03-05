import 'package:flutter/material.dart';
import 'package:gshop/features/shop/models/product_model.dart';
import 'package:gshop/features/shop/screens/product_details/widgets/product_variant_section_widget.dart';
import 'package:gshop/util/constants/sizes.dart';

class ProductVariationsWidget extends StatelessWidget {
  const ProductVariationsWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: product
            .getVariantPropertyKeys()
            .map((propertyKey) => ProductVariantSectionWidget(
                  productPropertyKey: propertyKey,
                  propertyValues: product.getVariantPropertyValues(propertyKey),
                ))
            .toList(),
      ),
    );
  }
}
