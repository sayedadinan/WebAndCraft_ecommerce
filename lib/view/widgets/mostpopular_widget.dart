import 'package:flutter/material.dart';
import 'package:webandcrafts_project/view/utils/color_theme/colors.dart';
import 'package:webandcrafts_project/view/utils/constants/custom_text.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';
import 'package:webandcrafts_project/view/utils/constants/sized_box.dart';
import 'package:webandcrafts_project/view/widgets/rating_star_widget.dart';

class MostPopularWidget extends StatelessWidget {
  const MostPopularWidget({
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
                text: 'Most Popular', size: 0.04, color: AppColors.blackColor),
            CustomSizedBoxWidth(0.25),
            CustomText(
                text: 'View all', size: 0.03, color: AppColors.blackColor),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: mediaquerywidth(0.04, context)),
          child: SizedBox(
            height: mediaqueryheight(0.30, context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: mediaquerywidth(0.40, context),
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
                                  height: mediaqueryheight(0.10, context),
                                  width: mediaquerywidth(0.30, context),
                                  child: Image.network(
                                    'https://m.media-amazon.com/images/I/413Oc6gWWoL._AC_UF1000,1000_QL80_.jpg',
                                  ),
                                ),
                              ],
                            ),
                            const CustomSizedBoxHeight(0.02),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.offerColor,
                                  borderRadius: BorderRadius.circular(12)),
                              width: mediaquerywidth(0.23, context),
                              height: mediaqueryheight(0.04, context),
                              child: const Center(
                                child: CustomText(
                                    text: 'Sales 65% Off',
                                    size: 0.02,
                                    color: Colors.white),
                              ),
                            ),
                            const CustomSizedBoxHeight(0.01),
                            const CustomText(
                                text: 'Lenovo K3 Mini Outdoor Wireless Speaker',
                                size: 0.02,
                                color: AppColors.blackColor),
                            const CustomSizedBoxHeight(0.01),
                            RatingStars(rating: 4),
                            const CustomSizedBoxHeight(0.01),
                            const Row(
                              children: [
                                CustomText(
                                    text: '₹100',
                                    size: 0.03,
                                    color: AppColors.blackColor),
                                CustomSizedBoxWidth(0.01),
                                AppdecorText(
                                    text: '₹200',
                                    size: 0.03,
                                    color: AppColors.blackColor)
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
