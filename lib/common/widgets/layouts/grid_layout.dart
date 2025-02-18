import 'package:flutter/material.dart';
import 'package:gshop/util/constants/sizes.dart';


class ProductGridLayout extends StatelessWidget {
  /// GridView for Products
  const ProductGridLayout({
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
      physics: const NeverScrollableScrollPhysics(),
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
