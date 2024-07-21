class BannerSingle {
  String type;
  String title;
  String imageUrl;
  String id;

  BannerSingle({
    required this.type,
    required this.title,
    required this.imageUrl,
    required this.id,
  });

  factory BannerSingle.fromJson(Map<String, dynamic> json) {
    return BannerSingle(
      type: json['type'],
      title: json['title'],
      imageUrl: json['image_url'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'image_url': imageUrl,
      'id': id,
    };
  }
}
