import 'package:flutter/material.dart';
import 'package:gshop/common/styles/padding_styles.dart';
import 'package:gshop/util/constants/sizes.dart';

class RatingsFilterWidget extends StatelessWidget {
  const RatingsFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List reviewFilters = ["All", "5 ⭐", "4 ⭐", "3 ⭐", "2 ⭐", "1 ⭐"];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: reviewFilters.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: PaddingStyles.horizontalListPadding(
              length: reviewFilters.length, index: index),
          child: ChoiceChip(
            label: Text(reviewFilters[index]),
            selected: index == 0,
            onSelected: (value) {},
          ),
        ),
        separatorBuilder: (_, int index) =>
            const SizedBox(width: GSizes.spaceBtwItems / 2),
      ),
    );
  }
}
