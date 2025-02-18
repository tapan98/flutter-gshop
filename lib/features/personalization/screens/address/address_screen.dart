import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/features/personalization/screens/address/widgets/address_card.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(title: Text(GTexts.myAddresses)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            children: [
              const AddressCard(),
              HelperFunctions.spaceBtwItemsHeight(),
              const AddressCard(),
            ],
          ),
        ),
      ),
    );
  }
}
