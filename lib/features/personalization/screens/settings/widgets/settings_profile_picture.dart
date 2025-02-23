import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/images/circular_image.dart';
import 'package:gshop/common/widgets/shimmers/shimmer_widget.dart';
import 'package:gshop/features/personalization/controllers/user/user_controller.dart';
import 'package:gshop/util/constants/image_strings.dart';

class SettingsProfilePicture extends StatelessWidget {
  const SettingsProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final double imageRadius = 80;
    return Obx(
      () => userController.profileLoading.value
          ? ShimmerWidget(
              width: imageRadius, height: imageRadius, radius: imageRadius)
          : userController.getProfilePictureUrl().isEmpty
              ? CircularImage(
                  imageUrl: GImages.dummyPersonImage,
                  radius: imageRadius,
                  isNetworkImage: false,
                )
              : CircularImage(
                  imageUrl: userController.getProfilePictureUrl(),
                  isNetworkImage: true,
                ),
    );
  }
}
