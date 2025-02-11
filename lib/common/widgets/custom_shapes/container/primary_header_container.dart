import 'package:flutter/material.dart';
import 'package:gshop/util/constants/colors.dart';

import '../clip_path_shapes/curved_bottom_widget.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [
        GColors.primary,
        GColors.primaryBackground,
      ],
      begin: Alignment.topLeft,
      end: Alignment(3.5,2),
    );
    return Column(
      children: [
        // Content
        Container(
          // color: GColors.primary,
          decoration: BoxDecoration(
            gradient: gradient,
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
                    gradient: gradient,
                  ),
                  height: 30,
                ),
              ),
            ),
            CurvedBottomWidget(
              child: Container(
                decoration: BoxDecoration(
                  gradient: gradient,
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
