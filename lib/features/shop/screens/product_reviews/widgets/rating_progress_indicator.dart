import 'package:flutter/material.dart';
import 'package:gshop/util/constants/colors.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.leadingText,
    required this.rating,
  });

  final String leadingText;

  /// [rating] describes the progress indicator value
  /// it should be between 0-1
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Leading text
        Expanded(
          flex: 1,
          child:
              Text(leadingText, style: Theme.of(context).textTheme.bodyMedium),
        ),

        Expanded(
          flex: 10,
          child: LinearProgressIndicator(
            value: rating,
            minHeight: 8,
            backgroundColor: GColors.grey,
            color: GColors.primary,
            borderRadius: BorderRadius.circular(100),
          ),
        )
      ],
    );
  }
}
