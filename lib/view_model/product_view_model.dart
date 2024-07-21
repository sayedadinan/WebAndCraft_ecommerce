import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webandcrafts_project/model/ad_banner_model.dart';
import 'package:webandcrafts_project/model/banner_model.dart';
import 'package:webandcrafts_project/model/category_model.dart';
import 'package:webandcrafts_project/model/feutured_model.dart';
import 'package:webandcrafts_project/model/popular_model.dart';
import 'package:webandcrafts_project/service/data/db_helper.dart';
import 'package:webandcrafts_project/service/data/products_data.dart';
import 'package:webandcrafts_project/view/widgets/banner_widget.dart';
import 'package:webandcrafts_project/view/widgets/category_widget.dart';
import 'package:webandcrafts_project/view/widgets/feutured_widget.dart';
import 'package:webandcrafts_project/view/widgets/mostpopular_widget.dart';
import 'package:webandcrafts_project/view/widgets/slider_banner_widget.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  List<PopularProducts> popularProductsList = [];
  List<Categories> categoriesList = [];
  List<BannerSlider> bannerSlidersList = [];
  List<BannerSingle> bannerSinglesList = [];
  List<FeaturedProductList> featuredProducts = [];
  List<Widget> dynamicWidgets = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchProductDetails() async {
    log('Fetching product details from provider...');
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _productService.fetchProductDetails();
      processData(response);
    } catch (error) {
      log('Error fetching product details: $error');
      await _fetchLocalDataOnError();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _fetchLocalDataOnError() async {
    log('Fetching local data due to API failure...');
    try {
      await fetchLocalData(); // Fetch local data if API fails
    } catch (error) {
      log('Error fetching local data: $error');
    }
  }

  Future<void> processData(List<dynamic> data) async {
    log('Processing data from provider...');
    List<Widget> newDynamicWidgets = [];

    try {
      for (var item in data) {
        log('Processing item with title: ${item['title']} and type: ${item['type']}');
        switch (item['type']) {
          case 'products':
            if (item['title'] == 'Best Sellers') {
              var popularProduct = PopularProducts.fromJson(item);
              await _databaseHelper.insertData(
                  'popular_products', popularProduct.toDatabaseJson());
              newDynamicWidgets.add(const MostPopularWidget());
              log('Added to popularProductsList: ${item['title']}');
            } else if (item['title'] == 'Most Popular') {
              var featuredProduct = FeaturedProductList.fromJson(item);
              await _databaseHelper.insertData(
                  'featured_products', featuredProduct.toDatabaseJson());
              newDynamicWidgets.add(const FeuturedWIdget());
              log('Added to featuredProductList: ${item['title']}');
            }
            break; // Add break statement here
          case 'catagories':
            var category = Categories.fromJson(item);
            await _databaseHelper.insertData(
                'categories', category.toDatabaseJson());
            newDynamicWidgets.add(const CategoryWidget());
            log('Added to categoriesList: ${item['title']}');
            break; // Add break statement here
          case 'banner_slider':
            var bannerSlider = BannerSlider.fromJson(item);
            await _databaseHelper.insertData(
                'banner_slider', bannerSlider.toDatabaseJson());
            newDynamicWidgets.add(PageViewWithIndicator());
            log('Added to bannerSlidersList: ${item['title']}');
            break; // Add break statement here
          case 'banner_single':
            var bannerSingle = BannerSingle.fromJson(item);
            await _databaseHelper.insertData(
                'banner_single', bannerSingle.toDatabaseJson());
            newDynamicWidgets.add(const AdImage());
            log('Added to bannerSinglesList: ${item['title']}');
            break;
          default:
            log('Unhandled type: ${item['type']}');
            break;
        }
      }
      log('Finished processing data.');
      await fetchLocalData();
    } catch (error) {
      log('Error processing data: $error');
      await fetchLocalData(); // Fetch local data if an error occurs
    } finally {
      dynamicWidgets = newDynamicWidgets;
      notifyListeners();
    }
  }

  Future<void> fetchLocalData() async {
    log('Fetching local data...');
    try {
      final popularProductsData =
          await _databaseHelper.getData('popular_products');
      popularProductsList = popularProductsData
          .map((item) => PopularProducts.fromDatabaseJson(item))
          .toList();

      final categoriesData = await _databaseHelper.getData('categories');
      categoriesList = categoriesData
          .map((item) => Categories.fromDatabaseJson(item))
          .toList();

      final bannerSlidersData = await _databaseHelper.getData('banner_slider');
      bannerSlidersList = bannerSlidersData
          .map((item) => BannerSlider.fromDatabaseJson(item))
          .toList();

      final bannerSinglesData = await _databaseHelper.getData('banner_single');
      bannerSinglesList = bannerSinglesData
          .map((item) => BannerSingle.fromDatabaseJson(item))
          .toList();

      final featuredProductsData =
          await _databaseHelper.getData('featured_products');
      featuredProducts = featuredProductsData
          .map((item) => FeaturedProductList.fromDatabaseJson(item))
          .toList();

      notifyListeners();
    } catch (error) {
      log('Error fetching local data: $error');
    }
  }
}
