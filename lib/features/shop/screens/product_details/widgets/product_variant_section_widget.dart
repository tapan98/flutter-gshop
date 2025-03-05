import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/util/constants/sizes.dart';

class ProductVariantSectionWidget extends StatelessWidget {
  const ProductVariantSectionWidget(
      {super.key, required this.productPropertyKey, required this.propertyValues});

  final String productPropertyKey;
  final List<String> propertyValues;

  @override
  Widget build(BuildContext context) {
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
          children: propertyValues.map((propertyValue) => ChoiceChip(
            label: Text(propertyValue),
            // TODO: get selected variant from product
            selected: false,
            // TODO: Do something
            onSelected: (value){},
          )).toList(),
        ),

      ],
    );
  }
}
