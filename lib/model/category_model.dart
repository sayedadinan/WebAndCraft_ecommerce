class Categories {
  String type;
  String title;
  List<Category> contents;
  String id;

  Categories({
    required this.type,
    required this.title,
    required this.contents,
    required this.id,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    var list = json['contents'] as List;
    List<Category> categoriesList =
        list.map((i) => Category.fromJson(i)).toList();

    return Categories(
      type: json['type'],
      title: json['title'],
      contents: categoriesList,
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'contents': contents.map((category) => category.toJson()).toList(),
      'id': id,
    };
  }
}

class Category {
  String title;
  String imageUrl;

  Category({
    required this.title,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image_url': imageUrl,
    };
  }
}
