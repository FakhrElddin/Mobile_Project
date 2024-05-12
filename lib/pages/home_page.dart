import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/widgets/categories_list_view.dart';
import 'package:mobile_project/widgets/close_app_snack_bar.dart';
import 'package:mobile_project/widgets/news_list_view_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'News',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              TextSpan(
                text: 'Cloud',
                style: TextStyle(
                  color: Colors.yellow[800],
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: DoubleBackToCloseApp(
        snackBar: closeAppSnackBar(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                  child: CategoriesListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                ),
              ),
              NewsListViewBuilder(
                category: 'general',
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






