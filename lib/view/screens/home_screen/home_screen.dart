import 'package:flutter/material.dart';
import 'package:webandcrafts_project/view/utils/color_theme/colors.dart';
import 'package:webandcrafts_project/view/utils/constants/custom_text.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';
import 'package:webandcrafts_project/view/utils/constants/sized_box.dart';
import 'package:webandcrafts_project/view/widgets/home_appbar.dart';
import 'package:webandcrafts_project/view/widgets/mostpopular_widget.dart';
import 'package:webandcrafts_project/view/widgets/slider_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size(double.infinity, mediaqueryheight(0.08, context)),
            child: const CustomHomeAppbar()),
        body: Column(children: [
          SizedBox(
              height: mediaqueryheight(0.20, context),
              child: PageViewWithIndicator()),
          const CustomSizedBoxHeight(0.02),
          const MostPopularWidget(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: mediaqueryheight(0.09, context),
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         image: NetworkImage(
              //             'https://oxygen-test.webc.in/media/cache/800x0/mobile/banner/i%20watch%20New_1675658860.jpg'),
              // fit: BoxFit.cover)),
              color: AppColors.appBarColor,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                  text: 'Most Popular',
                  size: 0.04,
                  color: AppColors.blackColor),
              CustomSizedBoxWidth(0.25),
              CustomText(
                  text: 'View all', size: 0.03, color: AppColors.blackColor),
            ],
          ),
        ]));
  }
}
