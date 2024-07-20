import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:webandcrafts_project/view/utils/color_theme/colors.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';
import 'package:webandcrafts_project/view/utils/constants/sized_box.dart';
import 'package:webandcrafts_project/view/widgets/category_widget.dart';
import 'package:webandcrafts_project/view/widgets/feutured_widget.dart';
import 'package:webandcrafts_project/view/widgets/home_appbar.dart';
import 'package:webandcrafts_project/view/widgets/mostpopular_widget.dart';
import 'package:webandcrafts_project/view/widgets/slider_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: const CustomHomeAppbar()),
      body: SingleChildScrollView(
        child: Column(children: [
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
          const CategoryWidget(),
          const CustomSizedBoxHeight(0.02),
          const FeuturedWIdget()
        ]),
      ),
      bottomNavigationBar: MotionTabBar(
        // controller:
        //     _motionTabBarController, // Add this controller if you need to change your tab programmatically
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: const ["Home", "Dashboard", "Profile", "Settings"],
        icons: const [
          Icons.dashboard,
          Icons.home,
          Icons.people_alt,
          Icons.settings
        ],
      ),
    );
  }
}
