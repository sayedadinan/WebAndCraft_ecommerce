import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<dynamic>> fetchProductDetails() async {
    const url = 'https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo';

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
