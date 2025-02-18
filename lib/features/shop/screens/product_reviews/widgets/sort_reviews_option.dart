import 'package:flutter/material.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';

class SortReviewsOption extends StatelessWidget {
  const SortReviewsOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          // TODO: Review Sort Dialog
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.all(GSizes.defaultSpace/2),
            child: Row(
              children: [
                Text(GTexts.mostRelevant),
                SizedBox(width: GSizes.spaceBtwItems/2),
                Icon(Icons.sort),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
