import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:webandcrafts_project/view/screens/account/account.dart';
import 'package:webandcrafts_project/view/screens/cart/cart.dart';
import 'package:webandcrafts_project/view/screens/category/category.dart';
import 'package:webandcrafts_project/view/screens/home_screen/home_screen.dart';
import 'package:webandcrafts_project/view/screens/offers/offers.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  late MotionTabBarController _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController =
        MotionTabBarController(initialIndex: 1, length: 5, vsync: this);
  }

  @override
  void dispose() {
    _motionTabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: const ["Home", "Category", "Cart", "Others", "Account"],
        icons: const [
          Icons.home,
          Icons.category,
          Icons.shopping_cart,
          Icons.other_houses,
          Icons.person
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.blue[600],
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.blue[900],
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController.index = value;
          });
        },
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _motionTabBarController,
        children: <Widget>[
          // MainPageContentComponent(
          //     title: "HomeSreen", controller: _motionTabBarController),
          const HomeScreen(),
          CartScreen(), OffersScreen(), AccountScreen(), CategoryScreen(),
        ],
      ),
    );
  }
}
