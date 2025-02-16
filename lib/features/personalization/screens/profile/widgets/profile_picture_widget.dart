import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/images/circular_profile_image.dart';
import 'package:gshop/util/constants/text_strings.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          // Image
          CircularProfileImage(
            width: 80,
            height: 80,
          ),
          // Change Picture TextButton
          TextButton(
            onPressed: () {},
            child: Text(GTexts.changeProfilePicture),
          ),
        ],
      ),
    );
  }
}
