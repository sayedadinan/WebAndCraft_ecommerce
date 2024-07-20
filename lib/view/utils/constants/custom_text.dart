import 'package:flutter/material.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';
import 'package:webandcrafts_project/view/utils/constants/paths.dart';

class CustomText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  const CustomText(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      this.textAlign,
      this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: weight,
          fontFamily: CustomFonts.primaryFont,
          color: color,
          fontSize: mediaquerywidth(size, context)),
    );
  }
}

class AppdecorText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight? weight;

  const AppdecorText({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: weight,
        fontFamily: CustomFonts.primaryFont,
        color: color,
        fontSize: mediaquerywidth(size, context),
        decoration: TextDecoration.lineThrough,
      ),
    );
  }
}
