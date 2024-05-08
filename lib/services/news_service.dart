

import 'package:dio/dio.dart';
import 'package:mobile_project/models/article_model.dart';

class NewsService {
  final Dio dio;
  const NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async{
    try {
      Response response = await dio.get(
              'https://newsapi.org/v2/top-headlines?country=us&apiKey=125b3eb6cee749ebb0c4534321ded29d&category=$category'
          );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      for(var article in articles){
            ArticleModel articleModel = ArticleModel.fromJson(article);
            articlesList.add(articleModel);
          }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
