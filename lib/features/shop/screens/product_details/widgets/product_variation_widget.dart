import 'package:flutter/material.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class ProductVariationWidget extends StatelessWidget {
  const ProductVariationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Variant", style: Theme.of(context).textTheme.titleLarge),
        HelperFunctions.spaceBtwItemsHeight(),
        Wrap(
          spacing: GSizes.spaceBtwItems,
          runSpacing: GSizes.spaceBtwItems,
          children: [
            ChoiceChip(
              label: Text("12GB + 256GB"),
              selected: true,
              onSelected: (value) {},
            ),
            ChoiceChip(
              label: Text("12GB + 512GB"),
              selected: false,
              onSelected: (value) {},
            ),
            ChoiceChip(
              label: Text("12GB + 1TB"),
              selected: false,
              onSelected: (value) {},
            ),
          ],
        ),
      ],
    );
  }
}
