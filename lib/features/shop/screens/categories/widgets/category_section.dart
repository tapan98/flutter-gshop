import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/custom_shapes/container/circular_image_text.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CategorySection extends StatelessWidget {
  /// Page of the selected category item
  const CategorySection({
    super.key,
    required this.sectionTitle,
    required this.scrollController,
    this.showShimmer = false,
  });

  final String sectionTitle;
  final ScrollController scrollController;
  final bool showShimmer;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelperFunctions.spaceBtwSectionsHeight(),

          // Section Heading
          showShimmer
              ? const ShimmerWidget(
                  height: 10,
                  width: double.infinity,
                )
              : SectionHeading(title: sectionTitle, maxLines: 2),

          HelperFunctions.spaceBtwSectionsHeight(),

          // Items
          //TODO: Fetch each category items from the controller
          GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: 105),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(GSizes.sm),
              child: showShimmer
                  ? const ShimmerWidget()
                  : CircularImageText(
                      image: GImages.product1,
                        text: "Smartphones",
                      onTap: () {},
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
