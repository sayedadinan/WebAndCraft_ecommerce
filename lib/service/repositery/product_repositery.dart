import 'dart:developer';
import 'package:webandcrafts_project/model/ad_banner_model.dart';
import 'package:webandcrafts_project/model/banner_model.dart';
import 'package:webandcrafts_project/model/category_model.dart';
import 'package:webandcrafts_project/model/feutured_model.dart';
import 'package:webandcrafts_project/model/popular_model.dart';
import 'package:webandcrafts_project/service/data/db_helper.dart';
import 'package:webandcrafts_project/service/data/products_data.dart';

class ProductRepository {
  final ProductService _productService = ProductService();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<dynamic>> fetchProductDetails() async {
    // the datas are geting from the service file and returning the response from here
    log('Fetching product details from repository...');
    try {
      final response = await _productService.fetchProductDetails();
      return response;
    } catch (error) {
      log('Error fetching product details: $error');
      throw error;
    }
  }

  Future<void> saveDataToLocalDb(List<dynamic> data) async {
    //from here the datas are storing to local storage and the available widgets are adding to widget list
    log('Processing data in repository...');

    for (var item in data) {
      log('Processing item with title: ${item['title']} and type: ${item['type']}');
      switch (item['type']) {
        //checking the type of the data and adding to widget list and storing to local storage and model class also

        case 'products':
          if (item['title'] == 'Best Sellers') {
            var popularProduct = PopularProducts.fromJson(item);
            await _databaseHelper.insertData(
                'popular_products', popularProduct.toDatabaseJson());
            log('Added to popularProductsList: ${item['title']}');
          } else if (item['title'] == 'Most Popular') {
            var featuredProduct = FeaturedProductList.fromJson(item);
            await _databaseHelper.insertData(
                'featured_products', featuredProduct.toDatabaseJson());
            log('Added to featuredProductList: ${item['title']}');
          }
          break;
        case 'catagories':
          var category = Categories.fromJson(item);
          await _databaseHelper.insertData(
              'categories', category.toDatabaseJson());
          log('Added to categoriesList: ${item['title']}');
          break;
        case 'banner_slider':
          var bannerSlider = BannerSlider.fromJson(item);
          await _databaseHelper.insertData(
              'banner_slider', bannerSlider.toDatabaseJson());
          log('Added to bannerSlidersList: ${item['title']}');
          break;
        case 'banner_single':
          var bannerSingle = BannerSingle.fromJson(item);
          await _databaseHelper.insertData(
              'banner_single', bannerSingle.toDatabaseJson());
          log('Added to bannerSinglesList: ${item['title']}');
          break;
        default:
          log('Unhandled type: ${item['type']}');
          break;
      }
    }
    log('Finished processing data.');
  }

  Future<Map<String, List<dynamic>>> fetchLocalData() async {
    //when the network is turned off at that time the data will fetch from local
    log('Fetching local data from repository...');

    final bannerSlidersData = await _databaseHelper.getData('banner_slider');
    final popularProductsData =
        await _databaseHelper.getData('popular_products');
    final bannerSinglesData = await _databaseHelper.getData('banner_single');
    final categoriesData = await _databaseHelper.getData('categories');
    final featuredProductsData =
        await _databaseHelper.getData('featured_products');

    return {
      //checking the type and returning the widgets
      'banner_slider': bannerSlidersData
          .map((item) => BannerSlider.fromDatabaseJson(item))
          .toList(),
      'popular_products': popularProductsData
          .map((item) => PopularProducts.fromDatabaseJson(item))
          .toList(),
      'banner_single': bannerSinglesData
          .map((item) => BannerSingle.fromDatabaseJson(item))
          .toList(),
      'categories': categoriesData
          .map((item) => Categories.fromDatabaseJson(item))
          .toList(),
      'featured_products': featuredProductsData
          .map((item) => FeaturedProductList.fromDatabaseJson(item))
          .toList(),
    };
  }
}
