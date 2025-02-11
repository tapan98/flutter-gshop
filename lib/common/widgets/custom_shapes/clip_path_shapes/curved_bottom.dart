import 'package:flutter/cupertino.dart';

class CurvedBottomEdges extends CustomClipper<Path> {
  CurvedBottomEdges({this.isShadow = false});

  final bool isShadow;

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 20);
    // first curve
    final endPoint = Offset(30, size.height);
    final controlPoint = Offset(0, size.height);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    // line to final curve
    path.lineTo(size.width - 30, size.height);

    final endPoint2 = Offset(size.width, size.height - 20);
    final controlPoint2 = Offset(size.width, size.height);

    path.quadraticBezierTo(
        controlPoint2.dx, controlPoint2.dy, endPoint2.dx, endPoint2.dy);

    // line to top right
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
