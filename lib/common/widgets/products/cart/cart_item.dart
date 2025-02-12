import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/images/rounded_corner_image.dart';
import 'package:gshop/common/widgets/products/cart/cart_product_add_remove_buttons.dart';
import 'package:gshop/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:gshop/common/widgets/texts/product_title_text.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, this.showAddRemoveButton = false});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Product Image
        RoundedCornerImage(
          imageUrl: GImages.product1,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(GSizes.sm),
          backgroundColor: isDark ? GColors.darkerGrey : GColors.light,
        ),

        HelperFunctions.spaceBtwItemsWidth(),

        // Title, Price & Variant
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Brand Text
              const BrandTitleTextWithVerifiedIcon(title: "Samsung"),
          
              // Product Name
              ProductTitleText(title: "Samsung Galaxy S24 Ultra"),
          
              // Variant 1
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Colour: ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "Titanium Gray",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),

              // Variant 2
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Variant: ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "12GB + 256GB",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),

              HelperFunctions.spaceBtwItemsHeight(),

              if (showAddRemoveButton)
                CartProductQuantityWithAddRemoveButtons(),
            ],
          ),
        ),
      ],
    );
  }
}
