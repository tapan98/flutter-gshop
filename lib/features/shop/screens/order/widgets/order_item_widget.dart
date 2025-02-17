import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    super.key,
    required this.imageUrl,
    required this.deliveryText,
    required this.product,
    required this.isNetworkImage,
    // TODO: Remove once backend is implemented
    this.shouldRate = true, this.onTap,
  });

  final String imageUrl, deliveryText, product;
  // TODO: Unnecessary for product item, as it should be a network image
  final bool isNetworkImage, shouldRate;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Image(
            image: AssetImage(imageUrl),
            width: 70,
            height: 70,
          ),
          // Delivered on Date Text
          title: Text(deliveryText),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: GSizes.spaceBtwItems / 2),
              Text(product),
              const SizedBox(height: GSizes.spaceBtwItems / 2),
              // TODO: Determine if item is to be rated
              if (shouldRate)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      initialRating: 0.0,
                      minRating: 1.0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      glow: false,
                      onRatingUpdate: (double rating) {
                        // TODO: Update rating
                      },
                      itemSize: GSizes.iconLg,
                      unratedColor: GColors.grey,
                      itemBuilder: (context, _) => FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: GSizes.spaceBtwItems / 2),
                    Text(
                      GTexts.rateThisProduct,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
            ],
          ),
          trailing: FaIcon(
            FontAwesomeIcons.angleRight,
            size: GSizes.iconMd,
          ),
        ),
      ),
    );
  }
}
