
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/local/cache_helper.dart';
import 'package:mobile_project/pages/home_page.dart';
import 'package:mobile_project/services/custom_page_route.dart';
import 'package:mobile_project/widgets/close_app_snack_bar.dart';
import 'package:mobile_project/widgets/on_boarding_body.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              TextButton(
                onPressed: () {
                  CacheHelper.saveData(key: 'onBoarding', value: true).then((value){
                    if(value){
                      Navigator.pushReplacement(context, CustomPageRoute(
                        child: const HomePage(),
                      ),
                      );
                    }
                  });
                },
                child: const Text(
                  'SKIP',
                  style: TextStyle(
                    color: Colors.orange
                  ),
                ),
              ),
            ],
          ),
          body: DoubleBackToCloseApp(
            snackBar: closeAppSnackBar(),
            child: const OnBoardingBody(),
          ),
        );
  }
}
