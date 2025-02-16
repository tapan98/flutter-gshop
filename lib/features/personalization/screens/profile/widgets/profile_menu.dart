import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gshop/util/constants/sizes.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.title,
    required this.value,
    this.suffixIcon = const FaIcon(
      FontAwesomeIcons.angleRight,
      size: GSizes.md,
    ),
    this.padding =
        const EdgeInsets.symmetric(vertical: GSizes.spaceBtwItems / 2),
    this.onTap,
  });

  final String title, value;
  final Widget suffixIcon;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
                flex: 2,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                )),
            suffixIcon,
          ],
        ),
      ),
    );
  }
}
