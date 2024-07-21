import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webandcrafts_project/view/utils/color_theme/colors.dart';
import 'package:webandcrafts_project/view/utils/constants/custom_text.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';
import 'package:webandcrafts_project/view/utils/constants/sized_box.dart';
import 'package:webandcrafts_project/view/widgets/rating_star_widget.dart';
import 'package:webandcrafts_project/view_model/product_view_model.dart';

class FeuturedWIdget extends StatelessWidget {
  const FeuturedWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsViewModel =
        Provider.of<ProductProvider>(context, listen: true);
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText(
                text: 'Feutured Products',
                size: 0.04,
                color: AppColors.blackColor),
            CustomSizedBoxWidth(0.25),
            CustomText(
                text: 'View all', size: 0.03, color: AppColors.blackColor),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: mediaquerywidth(0.04, context)),
          child: SizedBox(
            height: mediaqueryheight(0.35, context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productsViewModel.featuredProductList.length,
              itemBuilder: (context, index) {
                final products = productsViewModel.featuredProductList[index];
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
                                    products.contents[index].productImage,
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
                              child: Center(
                                child: CustomText(
                                    text:
                                        'Sales ${products.contents[index].discount}',
                                    size: 0.02,
                                    color: Colors.white),
                              ),
                            ),
                            const CustomSizedBoxHeight(0.01),
                            CustomText(
                                text: products.contents[index].productName,
                                size: 0.02,
                                color: AppColors.blackColor),
                            const CustomSizedBoxHeight(0.01),
                            RatingStars(
                              rating: products.contents[index].productRating,
                            ),
                            const CustomSizedBoxHeight(0.01),
                            Row(
                              children: [
                                CustomText(
                                    text: products.contents[index].offerPrice,
                                    size: 0.03,
                                    color: AppColors.blackColor),
                                const CustomSizedBoxWidth(0.01),
                                SizedBox(
                                  width: mediaquerywidth(0.12, context),
                                  child: AppdecorText(
                                      text:
                                          products.contents[index].actualPrice,
                                      size: 0.03,
                                      color: AppColors.blackColor),
                                )
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
