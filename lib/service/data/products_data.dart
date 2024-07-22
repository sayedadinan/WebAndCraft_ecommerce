import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:webandcrafts_project/service/data/api/home_api.dart';

class ProductService {
  Future<List<dynamic>> fetchProductDetails() async {
    //fetching the data from the api and the api url written in another file
    const url = API.homeApi;
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final products = jsonDecode(response.body);
        log('successfully returning form service');
        return products;
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (error) {
      log('Error: $error');
      return [];
    }
  }
}
