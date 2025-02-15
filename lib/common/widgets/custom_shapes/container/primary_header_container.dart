import 'package:flutter/material.dart';
import 'package:gshop/common/styles/gradient_styles.dart';

import '../clip_path_shapes/curved_bottom_widget.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    this.padding,
    this.child,
  });

  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Content
        Container(
          padding: padding,
          // color: GColors.primary,
          decoration: BoxDecoration(
            gradient: GradientStyles.primaryGradient,
          ),
          child: child,
        ),

        // Curved Bottom
        Stack(
          children: [
            Opacity(
              opacity: 0.4,
              child: CurvedBottomWidget(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: GradientStyles.primaryGradient,
                  ),
                  height: 30,
                ),
              ),
            ),
            CurvedBottomWidget(
              child: Container(
                decoration: BoxDecoration(
                  gradient: GradientStyles.primaryGradient,
                ),
                height: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
