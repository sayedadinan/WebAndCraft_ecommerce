class FeuturedProductList {
  String type;
  String title;
  List<Product> contents;
  String id;

  FeuturedProductList({
    required this.type,
    required this.title,
    required this.contents,
    required this.id,
  });

  factory FeuturedProductList.fromJson(Map<String, dynamic> json) {
    var list = json['contents'] as List;
    List<Product> productList = list.map((i) => Product.fromJson(i)).toList();

    return FeuturedProductList(
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
}

class Product {
  String sku;
  String productName;
  String productImage;
  int productRating;
  String actualPrice;
  String offerPrice;
  String discount;

  Product({
    required this.sku,
    required this.productName,
    required this.productImage,
    required this.productRating,
    required this.actualPrice,
    required this.offerPrice,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      sku: json['sku'],
      productName: json['product_name'],
      productImage: json['product_image'],
      productRating: json['product_rating'],
      actualPrice: json['actual_price'],
      offerPrice: json['offer_price'],
      discount: json['discount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sku': sku,
      'product_name': productName,
      'product_image': productImage,
      'product_rating': productRating,
      'actual_price': actualPrice,
      'offer_price': offerPrice,
      'discount': discount,
    };
  }
}
