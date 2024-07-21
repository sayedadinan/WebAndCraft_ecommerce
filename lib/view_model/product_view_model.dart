import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webandcrafts_project/model/ad_banner_model.dart';
import 'package:webandcrafts_project/model/banner_model.dart';
import 'package:webandcrafts_project/model/category_model.dart';
import 'package:webandcrafts_project/model/feutured_model.dart';
import 'package:webandcrafts_project/model/popular_model.dart';
import 'package:webandcrafts_project/service/data/products_data.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();

  List<PopularProducts> popularProductsList = [];
  List<Categories> categoriesList = [];
  List<BannerSlider> bannerSlidersList = [];
  List<BannerSingle> bannerSinglesList = [];
  List<FeuturedProductList> featuredProductList = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchProductDetails() async {
    log('Fetching product details from provider...');
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _productService.fetchProductDetails();
      _processData(response);
    } catch (error) {
      log('Error: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _processData(List<dynamic> data) {
    log('Processing data from provider...');
    popularProductsList = [];
    categoriesList = [];
    bannerSlidersList = [];
    bannerSinglesList = [];
    featuredProductList = [];

    for (var item in data) {
      log('Processing item with title: ${item['title']} and type: ${item['type']}');
      switch (item['type']) {
        case 'products':
          if (item['title'] == 'Best Sellers') {
            popularProductsList.add(PopularProducts.fromJson(item));
            log('Added to popularProductsList: ${item['title']}');
          } else if (item['title'] == 'Most Popular') {
            featuredProductList.add(FeuturedProductList.fromJson(item));
            log('Added to featuredProductList: ${item['title']}');
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
          log('Unhandled type: ${item['type']}');
          break;
      }
    }
    log('Finished processing data.');
    notifyListeners();
  }

  callFun() async {
    await fetchProductDetails();
  }
}
