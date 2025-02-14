import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/util/constants/sizes.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    this.textColor,
    this.onTap,
    this.buttonTitle, this.padding = const EdgeInsets.symmetric(horizontal: GSizes.defaultSpace),
  });

  final String title;
  final Color? textColor;
  final VoidCallback? onTap;
  final String? buttonTitle;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (onTap != null)
              buttonTitle != null
                  ? TextButton(onPressed: onTap, child: Text(buttonTitle!))
                  : FaIcon(FontAwesomeIcons.arrowRight),
          ],
        ),
      ),
    );
  }
}
