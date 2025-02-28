import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/custom_shapes/container/circular_image_text.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/shop/models/sub_category_model.dart';
import 'package:gshop/features/shop/screens/categories/widgets/category_section.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CategoryPage extends StatelessWidget {
  /// Page of the selected category item
  const CategoryPage({
    super.key,
    required this.subcategories,
    required this.scrollController,
    this.showShimmer = false,
  });

  final List<SubCategoryModel> subcategories;
  final ScrollController scrollController;

  /// Show shimmer effect if sub-categories
  /// are loading
  final bool showShimmer;

  @override
  Widget build(BuildContext context) {
    final shimmerSectionCount = 2;
    return SingleChildScrollView(
      controller: scrollController,
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (subcategories.isEmpty && !showShimmer)
            const Center(child: Text(GTexts.noSubCategoriesFound)),
          if (subcategories.isNotEmpty)
            ...List.generate(
              showShimmer ? shimmerSectionCount : subcategories.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: GSizes.defaultSpace),
                child: CategorySection(
                  title: showShimmer ? "" : subcategories[index].title,
                  showShimmer: showShimmer,
                  items: showShimmer ? [] : subcategories[index].items,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
