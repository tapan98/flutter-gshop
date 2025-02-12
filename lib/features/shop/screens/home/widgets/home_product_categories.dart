import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/images/vertical_image_text.dart';
import 'package:gshop/util/constants/image_strings.dart';

class HomeProductCategories extends StatelessWidget {
  const HomeProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => VerticalImageText(
          imageUrl: GImages.product1,
          text: "Category ${index + 1}",
        ),
      ),
    );
  }
}
