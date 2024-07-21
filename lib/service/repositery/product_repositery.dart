import 'dart:developer';

import 'package:webandcrafts_project/model/ad_banner_model.dart';
import 'package:webandcrafts_project/model/banner_model.dart';
import 'package:webandcrafts_project/model/category_model.dart';
import 'package:webandcrafts_project/model/feutured_model.dart';
import 'package:webandcrafts_project/model/popular_model.dart';
import 'package:webandcrafts_project/service/data/products_data.dart';

class ProductRepository {
  final ProductService productService = ProductService();

  Future<void> fetchAndProcessProducts() async {
    log('Start the work from repo');
    try {
      final response = await productService.fetchProductDetails();

      List<FeuturedProductList> featuredproductLists = [];
      List<PopularProducts> popularProductsList = [];
      List<Categories> categoriesList = [];
      List<BannerSlider> bannerSlidersList = [];
      List<BannerSingle> bannerSinglesList = [];

      for (var item in response) {
        log('Processing item with title: ${item['title']} and type: ${item['type']}');
        switch (item['type']) {
          case 'products':
            if (item['title'] == 'Best Sellers') {
              popularProductsList.add(PopularProducts.fromJson(item));
              log('Added to popularProductsList: ${item['title']}');
            } else if (item['title'] == 'Most Popular') {
              featuredproductLists.add(FeuturedProductList.fromJson(item));
              log('Added to featuredproductLists: ${item['title']}');
            }
            break;
          case 'catagories':
            categoriesList.add(Categories.fromJson(item));
            log('Added to categoriesList: ${item['title']}');
            break;
          case 'banner_slider':
            bannerSlidersList.add(BannerSlider.fromJson(item));
            log('Added to bannerSlidersList: ${item['title']}');
            break;
          case 'banner_single':
            bannerSinglesList.add(BannerSingle.fromJson(item));
            log('Added to bannerSinglesList: ${item['title']}');
            break;
          default:
            // Handle other types or ignore
            log('Unhandled type: ${item['type']}');
            break;
        }
      }
      log('Returned from repo');
      // Process or return your lists here
      log('Feature Lists: $featuredproductLists');
      log('Popular Products List: $popularProductsList');
      log('Categories List: $categoriesList');
      log('Banner Sliders List: $bannerSlidersList');
      log('Banner Singles List: $bannerSinglesList');
    } catch (error) {
      log('Error: $error');
    }
  }
}
