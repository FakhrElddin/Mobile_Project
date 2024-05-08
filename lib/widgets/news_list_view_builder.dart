import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/article_model.dart';
import 'package:mobile_project/services/news_service.dart';
import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key, required this.category,
  });

  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {


  // bool isLoading = true;
  // List<ArticleModel> articles = [];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getGeneralNews();
  // }
  //
  // Future<void> getGeneralNews() async {
  //   articles = await NewsService(Dio()).getNews();
  //   isLoading = false;
  //   setState(() {});
  // }
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsService(Dio()).getTopHeadlines(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return NewsListView(
                          articles: snapshot.data!,
                      );
          }
          else if(snapshot.hasError){
            return Text(
                              'error, try again later',
                            style: TextStyle(
                              color: Colors.yellow[800],
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          );
          }
          else{
            return SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow[800],
                  ),
                ),
              ),
            );
          }
        }
    );
    // return isLoading ? SliverToBoxAdapter(
    //     child: SizedBox(
    //       height: MediaQuery.of(context).size.height / 1.5,
    //       child: Center(
    //         child: CircularProgressIndicator(
    //           color: Colors.yellow[800],
    //         ),
    //       ),
    //     )
    // )
    //     :(articles.isEmpty) ? SliverToBoxAdapter(
    //     child: SizedBox(
    //       height: MediaQuery.of(context).size.height / 1.5,
    //       child: Center(
    //           child: Text(
    //               'error, try again later',
    //             style: TextStyle(
    //               color: Colors.yellow[800],
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold
    //             ),
    //           ),
    //       ),
    //     ),
    // )
    //     :NewsListView(
    //   articles: articles,
    // );
  }
}

