import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.imageUrl,
    required this.isNetworkImage,
    this.radius = 56,
    this.padding = GSizes.sm,
  });

  final BoxFit fit;
  final String imageUrl;
  final bool isNetworkImage;
  final double radius, padding;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Container(
      width: radius,
      height: radius,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: isDark ? GColors.black : GColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                fit: fit,
                progressIndicatorBuilder: (_, __, ___) => ShimmerWidget(
                  width: radius,
                  height: radius,
                  radius: radius,
                ),
                errorWidget: (_, __, ___) =>
                    const FaIcon(FontAwesomeIcons.circleExclamation),
              )
            : Image(
                image: AssetImage(imageUrl),
              ),
      ),
    );
  }
}
