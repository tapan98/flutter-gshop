import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gshop/util/constants/sizes.dart';

class RoundedCornerImage extends StatelessWidget {
  const RoundedCornerImage({
    super.key,
    required this.imageUrl,
    this.padding,
    this.width,
    this.height,
    this.border,
    this.borderRadius = GSizes.md,
    this.isNetworkImage = false,
    this.fit = BoxFit.contain,
    this.onTap,
  });

  final String imageUrl;
  final double? width, height;
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
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image(
            // TODO: Load Network Image
            image: AssetImage(imageUrl),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
