import 'package:flutter/material.dart';
import 'package:mobile_project/local/cache_helper.dart';
import 'package:mobile_project/pages/home_page.dart';
import 'package:mobile_project/pages/on_boarding_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  runApp(
      NewsApp(onBoarding: onBoarding!,)
  );
}


class NewsApp extends StatelessWidget {
  const NewsApp({super.key, required this.onBoarding});

  final bool onBoarding;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onBoarding ? HomePage() : OnBoardingPage(),
    );
  }
}
