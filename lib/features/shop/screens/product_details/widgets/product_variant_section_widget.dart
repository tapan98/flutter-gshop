import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/shop/controllers/products_controller.dart';
import 'package:gshop/util/constants/sizes.dart';

class ProductVariantSectionWidget extends StatelessWidget {
  const ProductVariantSectionWidget({
    super.key,
    required this.productPropertyKey,
    required this.propertyValues,
    required this.refresh,
  });

  final String productPropertyKey;
  final Set<String> propertyValues;

  /// This function is called when the user selects a variant.
  ///
  /// Intended to refresh the widget
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    final productsController = ProductsController.instance;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Variant title
        SectionHeading(
          title: productPropertyKey,
          padding: const EdgeInsets.symmetric(
            vertical: GSizes.spaceBtwItems,
          ),
        ),

        // Variant choice chips
        Wrap(
          spacing: GSizes.spaceBtwItems,
          runSpacing: GSizes.spaceBtwItems,
          children: propertyValues
              .map((propertyValue) => ChoiceChip(
                    label: Text(propertyValue),
                    selected: productsController.selectedProperties.value!
                        .containsValue(propertyValue),
                    onSelected: (value) {
                      if (value) {
                        productsController.selectedProperties
                            .value![productPropertyKey] = propertyValue;
                        productsController.updateProductVariant();
                        refresh();
                      }
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }
}
