import 'dart:convert';

class BannerSlider {
  String type;
  String title;
  List<Content> contents;
  String id;

  BannerSlider({
    required this.type,
    required this.title,
    required this.contents,
    required this.id,
  });

  factory BannerSlider.fromJson(Map<String, dynamic> json) {
    var list = json['contents'] as List;
    List<Content> contentsList = list.map((i) => Content.fromJson(i)).toList();

    return BannerSlider(
      type: json['type'],
      title: json['title'],
      contents: contentsList,
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'contents': contents.map((content) => content.toJson()).toList(),
      'id': id,
    };
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'contents':
          jsonEncode(contents.map((content) => content.toJson()).toList()),
    };
  }

  factory BannerSlider.fromDatabaseJson(Map<String, dynamic> json) {
    var list = jsonDecode(json['contents']) as List;
    List<Content> contentsList = list.map((i) => Content.fromJson(i)).toList();

    return BannerSlider(
      type: json['type'],
      title: json['title'],
      contents: contentsList,
      id: json['id'],
    );
  }
}

class Content {
  String title;
  String imageUrl;

  Content({
    required this.title,
    required this.imageUrl,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
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
