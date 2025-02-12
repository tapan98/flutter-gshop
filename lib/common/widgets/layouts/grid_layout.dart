import 'package:flutter/material.dart';
import 'package:gshop/util/constants/sizes.dart';


class GridLayout extends StatelessWidget {
  /// GridView for Products
  const GridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    this.scrollDirection = Axis.vertical,
    required this.itemBuilder,
  });

  final int itemCount;
  final double mainAxisExtent;
  final Axis scrollDirection;
  final Widget? Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        /// controls the height of the item
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: GSizes.gridViewSpacing,
        crossAxisSpacing: GSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
