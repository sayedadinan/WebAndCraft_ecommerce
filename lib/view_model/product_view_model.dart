import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:webandcrafts_project/model/ad_banner_model.dart';
import 'package:webandcrafts_project/model/banner_model.dart';
import 'package:webandcrafts_project/model/category_model.dart';
import 'package:webandcrafts_project/model/feutured_model.dart';
import 'package:webandcrafts_project/model/popular_model.dart';
import 'package:webandcrafts_project/service/repositery/product_repositery.dart';
import 'package:webandcrafts_project/view/widgets/banner_widget.dart';
import 'package:webandcrafts_project/view/widgets/category_widget.dart';
import 'package:webandcrafts_project/view/widgets/feutured_widget.dart';
import 'package:webandcrafts_project/view/widgets/mostpopular_widget.dart';
import 'package:webandcrafts_project/view/widgets/slider_banner_widget.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepository _productRepository = ProductRepository();

  List<PopularProducts> popularProductsList = [];
  List<Categories> categoriesList = [];
  List<BannerSlider> bannerSlidersList = [];
  List<BannerSingle> bannerSinglesList = [];
  List<FeaturedProductList> featuredProducts = [];
  List<Widget> dynamicWidgets = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchProductDetails() async {
    //getting the response from repositery file

    log('Fetching product details from provider...');
    _isLoading = true;
    notifyListeners();
//storing the datas to the list for updating the ui widgets
    try {
      final response = await _productRepository.fetchProductDetails();
      await _productRepository.saveDataToLocalDb(response);
      await fetchLocalData();
    } catch (error) {
      log('Error fetching product details: $error');
      await fetchLocalData(); // Fetch local data if API fails
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchLocalData() async {
    //in any case the network is tuned off then the datas will fetch from the database and it will show for that this funtion

    log('Fetching local data...');
    try {
      final localData = await _productRepository.fetchLocalData();
      //this is fetching the data from local and the widgets are adding to widget list for showing the ui
      bannerSlidersList = localData['banner_slider'] as List<BannerSlider>;
      popularProductsList =
          localData['popular_products'] as List<PopularProducts>;
      bannerSinglesList = localData['banner_single'] as List<BannerSingle>;
      categoriesList = localData['categories'] as List<Categories>;
      featuredProducts =
          localData['featured_products'] as List<FeaturedProductList>;
      //widgets to widget list
      dynamicWidgets = [
        PageViewWithIndicator(),
        const MostPopularWidget(),
        const AdImage(),
        const CategoryWidget(),
        const FeuturedWIdget(),
      ];

      notifyListeners();
    } catch (error) {
      log('Error fetching local data: $error');
    }
  }
}
