import 'package:flutter/material.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({super.key,
    required this.brandTitle,
    this.maxLines = 1,
    this.textAlign = TextAlign.center, this.color, this.textStyle,});

  final String brandTitle;
  final int maxLines;
  final TextAlign textAlign;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      brandTitle,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: textStyle ?? Theme.of(context).textTheme.labelMedium!.apply(color: color),
    );
  }
}
