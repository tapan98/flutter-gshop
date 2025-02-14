import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class ProductDetailsDeliverToOption extends StatelessWidget {
  const ProductDetailsDeliverToOption({
    super.key,
    required this.state,
    required this.pinCode,
    this.onChange,
  });

  final String state, pinCode;
  final VoidCallback? onChange;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          GTexts.deliverTo.capitalize!,
          style: Theme.of(context).textTheme.titleMedium?.apply(
                color: isDark
                    ? GColors.white.withValues(alpha: 0.5)
                    : GColors.black.withValues(alpha: 0.5),
              ),
        ),
        Text(
          "$state, $pinCode",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextButton(
          onPressed: onChange,
          child: Text(GTexts.change.capitalize!),
        ),
      ],
    );
  }
}
