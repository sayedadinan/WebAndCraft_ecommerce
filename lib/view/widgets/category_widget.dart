import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webandcrafts_project/view/utils/color_theme/colors.dart';
import 'package:webandcrafts_project/view/utils/constants/custom_text.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';
import 'package:webandcrafts_project/view/utils/constants/sized_box.dart';
import 'package:webandcrafts_project/view_model/product_view_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
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
              itemCount: productsViewModel.categoriesList.length,
              itemBuilder: (context, index) {
                final categoryList = productsViewModel.categoriesList[index];
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
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        categoryList.contents[index].imageUrl,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ],
                            ),
                            const CustomSizedBoxHeight(0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                    textAlign: TextAlign.center,
                                    text: categoryList.contents[index].title,
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
