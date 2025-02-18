import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/custom_shapes/container/circular_image_text.dart';
import 'package:gshop/common/widgets/texts/section_heading.dart';
import 'package:gshop/features/shop/controllers/category_controller.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.sectionTitle,
  });

  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: CategoryController.instance.sectionScrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelperFunctions.spaceBtwSectionsHeight(),

          // Section Heading
          SectionHeading(title: sectionTitle),

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
              child: CircularImageText(
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
