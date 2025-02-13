import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/common/widgets/products/cart/cart_item.dart';
import 'package:gshop/common/widgets/texts/delivery_date_with_charges_text.dart';
import 'package:gshop/common/widgets/texts/name_and_address_text.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/shop/screens/checkout/widgets/price_details_widget.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        title: Text(GTexts.orderSummary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Address
              SectionHeading(
                title: GTexts.deliverTo.capitalize!,
                buttonTitle: GTexts.change.capitalize,
                onTap: () {},
                padding: EdgeInsets.zero,
              ),

              NameAndAddressText(),

              const SizedBox(height: GSizes.spaceBtwSections/2),

              Divider(),
              const SizedBox(height: GSizes.spaceBtwSections/2),

              // Product(s) with offers applied
              // TODO: use CartItems instead to display multiple items
              CartItem(
                offersText: "2 Offers Applied · 2 Offers Available",
              ),

              // Expected Delivery Date

              DeliveryDateWithChargesText(
                deliveryDate: DateTime(2025, 2, 15),
                discountedDeliveryCharge: 0.0,
                normalDeliveryCharge: 40,
              ),

              const SizedBox(height: GSizes.spaceBtwSections/2),
              Divider(),
              const SizedBox(height: GSizes.spaceBtwSections/2),

              PriceDetailsWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
          onPressed: () {}, child: Text(GTexts.continueText.capitalize!)),
    );
  }
}
