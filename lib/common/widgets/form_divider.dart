import 'package:flutter/material.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(
            child: Divider(
                color: isDark ? Colors.white : Colors.grey,
                thickness: 0.5,
                indent: 40,
                endIndent: 10)),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
        Expanded(
            child: Divider(
                color: isDark ? Colors.white : Colors.grey,
                thickness: 0.5,
                indent: 10,
                endIndent: 40)),
      ],
    );
  }
}
