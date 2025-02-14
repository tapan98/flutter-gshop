import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/texts/delivery_date_with_charges_text.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import 'product_details_deliver_to_option.dart';

class ProductDeliverWidget extends StatelessWidget {
  const ProductDeliverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Deliver To Heading
          ProductDetailsDeliverToOption(
            state: "Delhi",
            pinCode: "110003",
            // TODO: show bottom sheet to select addresses
            onChange: () {},
          ),

          HelperFunctions.spaceBtwItemsHeight(),

          // Delivery Date
          DeliveryDateWithChargesText(
            deliveryDate: DateTime(2025, 02, 15),
            discountedDeliveryCharge: 0.0,
            normalDeliveryCharge: 40,
          ),
        ],
      ),
    );
  }
}
