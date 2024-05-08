

class ArticleModel{
  final String? image;
  final String title;
  final String? subTitle;
  final String content;

  const ArticleModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json){
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
      content: json['url'],
    );
  }

}



