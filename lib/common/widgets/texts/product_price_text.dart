import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    this.currencySign = "₹",
    required this.price,
    this.isLarge = false,
    this.lineThrough = false,
    this.textStyle,
  });

  final String currencySign, price;
  final bool isLarge, lineThrough;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      overflow: TextOverflow.ellipsis,
      style: textStyle ??
          (isLarge
              ? Theme.of(context).textTheme.headlineSmall!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null)
              : Theme.of(context).textTheme.labelMedium!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null)),
    );
  }
}
