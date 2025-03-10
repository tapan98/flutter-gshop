import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/custom_shapes/clip_path_shapes/curved_bottom_widget.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class ProductDetailsImagesSlider extends StatelessWidget {
  const ProductDetailsImagesSlider({super.key, required this.images});

  /// Images slider for product details screen
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Colors.white;
    return Column(
      children: [
        Container(
          color: backgroundColor,
          child: Column(
            children: [
              HelperFunctions.spaceBtwItemsHeight(),
              // Images slider
              CarouselSlider(
                options: CarouselOptions(),
                items: images
                    .map(
                      (url) => CachedNetworkImage(
                        imageUrl: url,
                        placeholder: (_, __) => AspectRatio(
                          aspectRatio: 1,
                          child: CircularProgressIndicator(
                            color: Colors.grey.shade100,
                          ),
                        ),
                        errorWidget: (_, __, ___) => const Placeholder(
                          child: Text(
                            GTexts.couldNotLoadImage,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        CurvedBottomWidget(
          child: Container(
            color: backgroundColor,
            height: 20,
          ),
        )
      ],
    );
  }
}
