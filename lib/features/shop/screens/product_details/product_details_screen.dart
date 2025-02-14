import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/shop/screens/product_details/widgets/product_deliver_widget.dart';
import 'package:gshop/features/shop/screens/product_details/widgets/product_details_images_slider.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

import 'widgets/product_details_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Images Slider
            ProductDetailsImagesSlider(
                images: [1, 2, 3, 4].map((item) => GImages.product1).toList()),

            HelperFunctions.spaceBtwSectionsHeight(),

            // Product Details
            ProductDetailsWidget(),

            HelperFunctions.spaceBtwItemsHeight(),

            ProductDeliverWidget(),

            const SizedBox(height: GSizes.spaceBtwSections / 2),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: GSizes.defaultSpace,
              ),
              child: Divider(),
            ),

            const SizedBox(height: GSizes.spaceBtwSections / 2),

            // Reviews
            SectionHeading(
              title: "Reviews (255)",
              onTap: () {},
            ),

            HelperFunctions.spaceBtwSectionsHeight(),

            Row(
              children: [],
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: TextButton(onPressed: (){}, child: Text("Add to Cart")),
          ),
          Expanded(
              child: ElevatedButton(
            onPressed: () {},
            child: Text("Buy Now"),
          ))
        ],
      ),
    );
  }
}
