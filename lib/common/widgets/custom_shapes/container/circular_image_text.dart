import 'package:flutter/material.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CircularImageText extends StatelessWidget {
  const CircularImageText({
    super.key,
    this.width = 56,
    this.height = 56,
    this.imagePadding = GSizes.sm,
    required this.image,
    this.overlayColor,
    this.fit = BoxFit.cover,
    required this.text,
    this.onTap,
    this.imageBackgroundColor,
  });

  final double width, height, imagePadding;
  final String text;
  final String image;
  final Color? overlayColor;
  final BoxFit fit;
  final VoidCallback? onTap;
  final Color? imageBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          // Circular Image
          Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(imagePadding),
            decoration: BoxDecoration(
              color: imageBackgroundColor ?? (isDark ? GColors.darkerGrey : GColors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: AssetImage(image),
                color: overlayColor,
              ),
            ),
          ),

          const SizedBox(height: GSizes.spaceBtwItems / 2),

          // Text
          Text(text,
              maxLines: 1,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
