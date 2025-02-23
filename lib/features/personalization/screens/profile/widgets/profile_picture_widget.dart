import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/images/circular_image.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/features/personalization/controllers/user/user_controller.dart';
import 'package:gshop/util/constants/image_strings.dart';
import 'package:gshop/util/constants/text_strings.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final double imageRadius = 100;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          // Image
          Obx(
            () => userController.profileLoading.value
                ? ShimmerWidget(
                    width: imageRadius,
                    height: imageRadius,
                    radius: imageRadius)
                : userController.getProfilePictureUrl().isEmpty
                    ? CircularImage(
                        imageUrl: GImages.dummyPersonImage,
                        radius: imageRadius,
                        isNetworkImage: false,
                      )
                    : CircularImage(
                        imageUrl: userController.getProfilePictureUrl(),
                        radius: imageRadius,
                        isNetworkImage: true,
                      ),
          ),
          // Change Picture TextButton
          TextButton(
            onPressed: userController.updateProfilePicture,
            child: const Text(GTexts.changeProfilePicture),
          ),
        ],
      ),
    );
  }
}
