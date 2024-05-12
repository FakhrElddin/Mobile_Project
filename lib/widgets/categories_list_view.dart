import 'package:flutter/material.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';
import 'package:mobile_project/models/category_model.dart';
import 'package:mobile_project/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/business.jpg',name: 'Business'),
    CategoryModel(image: 'assets/entertainment.avif',name: 'Entertainment'),
    CategoryModel(image: 'assets/science.avif',name: 'Science'),
    CategoryModel(image: 'assets/health.avif',name: 'Health'),
    CategoryModel(image: 'assets/sports.jpg',name: 'Sports'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListWheelScrollViewX(
        physics: BouncingScrollPhysics(),
        itemExtent: 300,
        scrollDirection: Axis.horizontal,
        children: [
          for(int i = 0; i < categories.length; i++)
            CategoryCard(
              category: categories[i],
            ),
        ],
      ),
    );
  }
}

// child: AnimationLimiter(
//   child: ListView.separated(
//     physics: BouncingScrollPhysics(),
//     scrollDirection: Axis.horizontal,
//     itemCount: categories.length,
//     separatorBuilder: (context, index) => SizedBox(width: 10,),
//     itemBuilder: (BuildContext context, int index) {
//       return AnimationConfiguration.staggeredList(
//         position: index,
//         delay: const Duration(milliseconds: 100),
//         child: SlideAnimation(
//           duration: const Duration(milliseconds: 2500),
//           curve: Curves.fastEaseInToSlowEaseOut,
//           horizontalOffset: 30,
//           verticalOffset: 300.0,
//           child: FlipAnimation(
//             duration: const Duration(milliseconds: 3000),
//             curve: Curves.fastEaseInToSlowEaseOut,
//             flipAxis: FlipAxis.y,
//             child: CategoryCard(
//               category: categories[index],
//             ),
//           ),
//         ),
//       );
//     },
//   ),
// ),