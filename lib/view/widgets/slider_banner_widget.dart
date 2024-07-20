import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:webandcrafts_project/view/utils/color_theme/colors.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';

class PageViewWithIndicator extends StatelessWidget {
  final PageController adController = PageController();

  PageViewWithIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaqueryheight(0.03, context),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: adController,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.blackColor,
                  // image: const DecorationImage(
                  //     image: NetworkImage(url), fit: BoxFit.cover),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            child: Transform.scale(
              scale: 0.5,
              child: SmoothPageIndicator(
                controller: adController,
                count: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
