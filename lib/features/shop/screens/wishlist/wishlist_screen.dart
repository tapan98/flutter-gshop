import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(title: Text(GTexts.wishlist.capitalize!)),
      body: const Padding(
        padding: EdgeInsets.all(GSizes.defaultSpace),
        // TODO: fetch wishlist items
        // child: ProductGridLayout(
        //   itemCount: 4,
        //   itemBuilder: (context, index) => const ProductCardVertical(
        //     imageUrl: GImages.product1,
        //     productTitle: "Samsung Galaxy S24 Ultra",
        //     productRating: "4.3",
        //   ),
        // ),
      ),
    );
  }
}
