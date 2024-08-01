class NewsModel {
  final int id;
  final String image;
  final String title;
  final String createdAt;

  NewsModel(
      {required this.id,
      required this.image,
      required this.title,
      required this.createdAt});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      image: json['image_default'],
      title: json['title'],
      createdAt: json['created_at'],
    );
  }
}
