import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/texts/brand_title_text.dart';
import 'package:gshop/util/constants/sizes.dart';

class BrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const BrandTitleTextWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = Colors.blue,
    this.textAlign = TextAlign.center,
    this.textStyle,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BrandTitleText(
            brandTitle: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            textStyle: textStyle,
          ),
        ),
        const SizedBox(width: GSizes.xs),

        Icon(Icons.verified, color: iconColor, size: GSizes.iconXs),
      ],
    );
  }
}
