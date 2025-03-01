import 'package:flutter/material.dart';
import 'package:gshop/features/shop/models/sub_category_model.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_section.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CategoryPage extends StatelessWidget {
  /// Page of the selected category item
  const CategoryPage({
    super.key,
    this.subcategories,
    required this.scrollController,
    this.showShimmer = false,
  });

  final List<SubCategoryModel>? subcategories;
  final ScrollController scrollController;

  /// Show shimmer effect if sub-categories
  /// are loading
  final bool showShimmer;

  @override
  Widget build(BuildContext context) {
    final shimmerSectionCount = 2;
    return ListView.separated(
      shrinkWrap: true,
      itemCount: showShimmer ? shimmerSectionCount : subcategories?.length ?? 0,
      itemBuilder: (_, index) => CategorySection(
        title: showShimmer ? "" : subcategories?[index].title ?? "",
        showShimmer: showShimmer,
        items: showShimmer ? [] : subcategories?[index].items?? [],
      ),
      separatorBuilder: (_,__) => HelperFunctions.spaceBtwSectionsHeight(),
    );
  }
}
