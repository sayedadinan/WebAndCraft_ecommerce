import 'package:flutter/material.dart';
import 'package:webandcrafts_project/view/utils/color_theme/colors.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          size: mediaquerywidth(0.03, context),
          color: index < rating ? AppColors.ratingStarColor : Colors.grey,
        );
      }),
    );
  }
}
