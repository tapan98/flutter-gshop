import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/logger/logger.dart';

class RoundedCornerImage extends StatelessWidget {
  const RoundedCornerImage({
    super.key,
    required this.imageUrl,
    this.showShimmer = false,
    this.padding,
    this.width,
    this.height,
    this.border,
    this.borderRadius = GSizes.md,
    required this.isNetworkImage,
    this.fit = BoxFit.contain,
    this.onTap,
    this.backgroundColor,
  });

  final String imageUrl;
  final bool showShimmer;
  final double? width, height;
  final Color? backgroundColor;
  final BoxBorder? border;
  final double borderRadius;
  final bool isNetworkImage;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: showShimmer ? const ShimmerWidget() : (isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: fit,
                  progressIndicatorBuilder: (_, __, ___) =>
                      const ShimmerWidget(),
                  errorWidget: (_, __, ___)
                  {
                    Log.error("Failed to load image: $imageUrl");
                    return const Placeholder(
                      child: Text("Couldn't load image"),
                    );
                  },
                )
              : Image(
                  image: AssetImage(imageUrl),
                  fit: fit,
                )),
        ),
      ),
    );
  }
}
