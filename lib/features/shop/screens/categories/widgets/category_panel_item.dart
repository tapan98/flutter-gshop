import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/images/vertical_image_text.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/util/constants/sizes.dart';

class CategoryPanelItem extends StatelessWidget {
  const CategoryPanelItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.isNetworkImage,
    this.showShimmer = false,
    this.onTap,
    required this.backgroundColor,
  });

  final String imageUrl, title;
  final bool isNetworkImage, showShimmer;
  final Color backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: GSizes.sm),
        decoration: BoxDecoration(
          // Highlight selected Category
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(GSizes.md),
            bottomRight: Radius.circular(GSizes.md),
          ),
        ),
        child: showShimmer
            ? const ShimmerWidget()
            : VerticalImageText(
                imageUrl: imageUrl,
                isNetworkImage: isNetworkImage,
                text: title,
              ),
      ),
    );
  }
}
