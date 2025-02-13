import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/texts/product_price_text.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:intl/intl.dart';

class DeliveryDateWithChargesText extends StatelessWidget {
  const DeliveryDateWithChargesText({
    super.key,
    required this.deliveryDate,
    required this.discountedDeliveryCharge,
    required this.normalDeliveryCharge,
  });

  final DateTime deliveryDate;
  final double discountedDeliveryCharge;
  final double normalDeliveryCharge;

  @override
  Widget build(BuildContext context) {
    final String weekDay = DateFormat('E').format(deliveryDate);
    final String month = DateFormat("MMM").format(deliveryDate);
    return Row(
      children: [
        // Delivery Date
        Text(
          "${GTexts.deliveryBy} $weekDay, ${deliveryDate.day} $month",
        ),

        // Separator
        Text(" | "),

        // -- Delivery Charges --
        // Free delivery
        if (discountedDeliveryCharge == 0.0)
          Row(
            children: [
              Text(
                "${GTexts.freeDelivery} ",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.apply(color: GColors.success),
              ),
              ProductPriceText(
                price: "$normalDeliveryCharge",
                lineThrough: true,
              ),
            ],
          ),
      ],
    );
  }
}
