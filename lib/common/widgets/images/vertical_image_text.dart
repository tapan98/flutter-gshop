import 'package:flutter/material.dart';
import 'package:gshop/util/constants/sizes.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.imageUrl,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.isNetworkImage = false,
    this.imageWidth = 56,
    this.imageHeight = 56,
    this.onTap,
    this.padding = EdgeInsets.zero,
  });

  final String imageUrl;
  final String text;
  final double? imageWidth, imageHeight;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor, textColor;
  final VoidCallback? onTap;

  /// TODO: Implement network image support
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            // Icon Image
            Image(
              image: AssetImage(imageUrl),
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.fill,
            ),

            const SizedBox(height: GSizes.spaceBtwItems / 2),

            // Text
            Text(
              text,
              style: Theme.of(context).textTheme.labelLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
