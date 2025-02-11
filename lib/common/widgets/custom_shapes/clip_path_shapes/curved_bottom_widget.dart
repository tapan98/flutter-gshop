import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/custom_shapes/clip_path_shapes/curved_bottom.dart';

class CurvedBottomWidget extends StatelessWidget {
  const CurvedBottomWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedBottomEdges(),
      child: child,
    );
  }
}
