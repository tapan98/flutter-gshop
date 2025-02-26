import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/util/constants/sizes.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.imageUrl,
    required this.text,
    this.backgroundColor,
    this.textColor,
    required this.isNetworkImage,
    this.imageWidth = 56,
    this.imageHeight = 56,
    this.fit = BoxFit.fill,
    this.onTap,
    this.padding = EdgeInsets.zero,
  });

  final String imageUrl;
  final String text;
  final double imageWidth, imageHeight;
  final BoxFit fit;
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
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon Image
            isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: imageWidth,
                    height: imageHeight,
                    fit: fit,
                    progressIndicatorBuilder: (_, __, ___) => ShimmerWidget(
                      width: imageWidth,
                      height: imageHeight,
                      radius: 0,
                    ),
                    errorWidget: (_,__,___) => const Placeholder(
                      child: Text("Couldn't load image"),
                    ),
                  )
                : Image(
                    image: AssetImage(imageUrl),
                    width: imageWidth,
                    height: imageHeight,
                    fit: fit,
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
