import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/custom_shapes/container/circular_image_text.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/shop/models/sub_category_item_model.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.title,
    required this.showShimmer,
    required this.items,
  });

  final bool showShimmer;
  final String title;
  final List<SubCategoryItemModel> items;

  @override
  Widget build(BuildContext context) {
    final int shimmerItemsCount = 5;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading
        showShimmer
            ? const ShimmerWidget(
                height: 20,
                width: double.infinity,
              )
            : SectionHeading(
                title: title.isEmpty ? "-" : title,
                maxLines: 2,
              ),

        HelperFunctions.spaceBtwSectionsHeight(),

        // Items
        GridView.builder(
          itemCount: showShimmer ? shimmerItemsCount : items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 110,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(GSizes.sm),
            child: showShimmer
                ? const ShimmerWidget()
                : CircularImageText(
                  image: showShimmer ? "" : items[index].image,
                  text: showShimmer ? "" : items[index].name,
                  isNetworkImage: true,
                  onTap: () {
                    // TODO: Navigate to filtered products page
                  },
                ),
          ),
        ),
      ],
    );
  }
}
