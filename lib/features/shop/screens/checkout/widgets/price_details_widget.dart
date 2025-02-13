import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/texts/product_price_text.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price details
        SectionHeading(
          title: GTexts.priceDetails,
          padding: EdgeInsets.zero,
        ),

        HelperFunctions.spaceBtwItemsHeight(),

        // Price (# Items)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${GTexts.price.capitalize} (1 ${GTexts.item})"),
            ProductPriceText(price: "100,000"),
          ],
        ),
        const SizedBox(height: GSizes.spaceBtwItems / 2),

        // Discount
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(GTexts.discount.capitalize!),
            Text(
              "-₹29,000",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.apply(color: GColors.success),
            ),
          ],
        ),

        const SizedBox(height: GSizes.spaceBtwItems / 2),

        // Delivery Charges

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(GTexts.deliveryCharges),
            Text(
              GTexts.freeDelivery,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.apply(color: GColors.success),
            ),
          ],
        ),

        HelperFunctions.spaceBtwItemsHeight(),

        // Total Amount
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              GTexts.totalAmount,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ProductPriceText(price: "71,000", isLarge: true),
          ],
        ),

        HelperFunctions.spaceBtwItemsHeight(),

        // Saving Amount Text
        Text(
          "${GTexts.youWillSave} ₹29,000 ${GTexts.onThisOrder}",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.apply(color: GColors.success),
        ),
      ],
    );
  }
}
