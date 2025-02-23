import 'package:flutter/material.dart';
import 'package:gshop/common/widgets/animation/loading_animation.dart';
import 'package:gshop/util/constants/colors.dart';
import 'package:gshop/util/helpers/helper_functions.dart';

class FullScreenLoadingAnimation {
  static void startLoading(BuildContext context, String animation, text) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Container(
          color: HelperFunctions.isDarkMode(context)
              ? GColors.dark
              : GColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Center(
              child: LoadingAnimation(
                  text: text, lottieAnimation: animation)),
        ),
      ),
    );
  }

  static void stopLoading(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  FullScreenLoadingAnimation._();
}
