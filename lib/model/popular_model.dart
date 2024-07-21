import 'dart:convert';

import 'package:webandcrafts_project/model/feutured_model.dart';

class FeaturedProductList {
  String type;
  String title;
  List<Product> contents;
  String id;

  FeaturedProductList({
    required this.type,
    required this.title,
    required this.contents,
    required this.id,
  });

  factory FeaturedProductList.fromJson(Map<String, dynamic> json) {
    var list = json['contents'] as List;
    List<Product> productList = list.map((i) => Product.fromJson(i)).toList();

    return FeaturedProductList(
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

  factory FeaturedProductList.fromDatabaseJson(Map<String, dynamic> json) {
    var list = jsonDecode(json['contents']) as List;
    List<Product> productList = list.map((i) => Product.fromJson(i)).toList();

    return FeaturedProductList(
      type: json['type'],
      title: json['title'],
      contents: productList,
      id: json['id'],
    );
  }
}
