
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mobile_project/models/article_model.dart';

import 'package:mobile_project/widgets/news_tile.dart';



class NewsListView extends StatelessWidget {

  final List<ArticleModel> articles;

  const NewsListView({super.key, required this.articles});


  @override
  Widget build(BuildContext context) {

    return AnimationLimiter(
      child: SliverList.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              horizontalOffset: 30,
              verticalOffset: 300.0,
              child: FlipAnimation(
                duration: const Duration(milliseconds: 3000),
                curve: Curves.fastLinearToSlowEaseIn,
                flipAxis: FlipAxis.y,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: NewsTile(
                    articleModel: articles[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


