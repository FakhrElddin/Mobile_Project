import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/article_model.dart';
import 'package:mobile_project/pages/news_page.dart';
import 'package:mobile_project/services/custom_page_route.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

   final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(CustomPageRoute(
          child: NewsPage(
          content: articleModel.content,
        ),
        ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: articleModel.image ??
                  'https://thumbs.dreamstime.com/z/breaking-news-screen-26292171.jpg?w=2048',
              placeholder: (context, url) => Center(child: CircularProgressIndicator(
                color: Colors.yellow[800],
              )),
              errorWidget: (context, url, error) => Center(child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Icons.error,
                    color: Colors.yellow[800],
                    size: 50,
                  ),
                  Text(
                    'Sorry, this Image is not available in your region.',
                  ),
                ],
              )),
            ),
            // child: Image.network(
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            //   height: 200,
            //   articleModel.image ??
            //   'https://thumbs.dreamstime.com/z/breaking-news-screen-26292171.jpg?w=2048'
            //   ,
            // ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            articleModel.title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            articleModel.subTitle ?? '',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
