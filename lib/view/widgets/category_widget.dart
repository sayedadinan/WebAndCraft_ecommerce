import 'package:flutter/material.dart';
import 'package:webandcrafts_project/view/utils/color_theme/colors.dart';
import 'package:webandcrafts_project/view/utils/constants/custom_text.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';
import 'package:webandcrafts_project/view/utils/constants/sized_box.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText(
                text: 'Categories', size: 0.04, color: AppColors.blackColor),
            CustomSizedBoxWidth(0.25),
            CustomText(
                text: 'View all', size: 0.03, color: AppColors.blackColor),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: mediaquerywidth(0.04, context)),
          child: SizedBox(
            height: mediaqueryheight(0.14, context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: mediaquerywidth(0.30, context),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.prodectBorderColor),
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.whiteColor),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: mediaquerywidth(0.03, context),
                            right: mediaquerywidth(0.03, context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomSizedBoxHeight(0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: mediaqueryheight(0.06, context),
                                  width: mediaquerywidth(0.20, context),
                                  child: Image.network(
                                    'https://m.media-amazon.com/images/I/413Oc6gWWoL._AC_UF1000,1000_QL80_.jpg',
                                  ),
                                ),
                              ],
                            ),
                            const CustomSizedBoxHeight(0.01),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                    textAlign: TextAlign.center,
                                    text: 'Grocery & Foods',
                                    size: 0.02,
                                    color: AppColors.blackColor),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
