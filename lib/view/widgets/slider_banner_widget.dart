import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:webandcrafts_project/view/utils/color_theme/colors.dart';
import 'package:webandcrafts_project/view/utils/constants/mediaquery.dart';
import 'package:webandcrafts_project/view_model/product_view_model.dart';

class PageViewWithIndicator extends StatelessWidget {
  final PageController adController = PageController();

  PageViewWithIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final productsViewModel =
        Provider.of<ProductProvider>(context, listen: true);
    return SizedBox(
      height: mediaqueryheight(0.23, context),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: adController,
            itemCount: 3,
            itemBuilder: (context, index) {
              final sliderBannerList =
                  productsViewModel.bannerSlidersList[index];

              // Check if the contents list is not empty
              if (sliderBannerList.contents.isNotEmpty) {
                return Container(
                  decoration: const BoxDecoration(
                    color: AppColors.blackColor,
                  ),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: sliderBannerList.contents[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
            
                return Container(
                  color: AppColors.blackColor,
                  child: const Center(
                    child: Text(
                      'No image available',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
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
