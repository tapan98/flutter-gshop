import 'package:flutter/material.dart';
import 'package:gshop/util/constants/image_strings.dart';
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
          const CircleAvatar(
            backgroundImage: AssetImage(GImages.dummyPersonImage),
           radius: 40,
          ),
          // Change Picture TextButton
          TextButton(
            onPressed: () {},
            child: const Text(GTexts.changeProfilePicture),
          ),
        ],
      ),
    );
  }
}
