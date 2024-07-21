import 'dart:convert';

import 'package:webandcrafts_project/model/feutured_model.dart';

class PopularProducts {
  String type;
  String title;
  List<Product> contents;
  String id;

  PopularProducts({
    required this.type,
    required this.title,
    required this.contents,
    required this.id,
  });

  factory PopularProducts.fromJson(Map<String, dynamic> json) {
    var list = json['contents'] as List;
    List<Product> productList = list.map((i) => Product.fromJson(i)).toList();

    return PopularProducts(
      type: json['type'],
      title: json['title'],
      contents: productList,
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'contents': contents.map((product) => product.toJson()).toList(),
      'id': id,
    };
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'contents':
          jsonEncode(contents.map((product) => product.toJson()).toList()),
    };
  }

  factory PopularProducts.fromDatabaseJson(Map<String, dynamic> json) {
    var list = jsonDecode(json['contents']) as List;
    List<Product> productList = list.map((i) => Product.fromJson(i)).toList();

    return PopularProducts(
      type: json['type'],
      title: json['title'],
      contents: productList,
      id: json['id'],
    );
  }
}
