import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/device_utils/device_utility.dart';

class ProductReviewAppbar extends StatelessWidget implements PreferredSizeWidget{
  const ProductReviewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GAppBar(
      centerTitle: false,
      title: Row(
        children: [
          // Image
          const Image(
            image: AssetImage(GImages.product1),
            height: GSizes.appBarHeight / 2,
          ),
          const SizedBox(width: GSizes.spaceBtwItems / 2),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Samsung Galaxy S24 Ultra",
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  GTexts.ratingsAndReviews,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
