import 'package:flutter/material.dart';
import 'package:webandcrafts_project/view/utils/color_theme/colors.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryheight(0.14, context),
      color: AppColors.appBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.blackColor,
            size: mediaquerywidth(0.08, context),
          ),
          // Transform.scale(
          //     scaleX: 1.0,
          //     scaleY: 1.3,
          //     // scale: 1.0,
          //     child: Image.asset(AppImages.cartImage)),
          SizedBox(
              height: mediaqueryheight(0.05, context),
              width: mediaquerywidth(0.62, context),
              child: const SearchBar(
                trailing: [Icon(Icons.search)],
              )),
          Icon(
            Icons.notifications_none_outlined,
            color: AppColors.whiteColor,
            size: mediaquerywidth(0.08, context),
          )
        ],
      ),
    );
  }
}
