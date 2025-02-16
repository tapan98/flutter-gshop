import 'package:flutter/material.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';

class CircularProfileImage extends StatelessWidget {
  const CircularProfileImage({
    super.key,
    this.imageUrl = GImages.dummyPersonImage,
    this.isNetworkImage = false,
    this.width = GSizes.iconLg,
    this.height = GSizes.iconLg,
  });

  final String imageUrl;
  final bool isNetworkImage;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image(image: AssetImage(imageUrl)),
      ),
    );
  }
}
