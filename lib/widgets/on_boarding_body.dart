
import 'package:flutter/material.dart';
import 'package:mobile_project/local/cache_helper.dart';
import 'package:mobile_project/models/boarding_model.dart';
import 'package:mobile_project/pages/home_page.dart';
import 'package:mobile_project/services/custom_page_route.dart';
import 'package:mobile_project/widgets/boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {

  final List<BoardingModel> boardingList = const [
    BoardingModel(
      image: 'assets/onboarding_1.svg',
      title: 'ABOUT APP',
      body: 'The App is for all important or top headlines news in USA',
    ),
    BoardingModel(
      image: 'assets/onboarding_2.svg',
      title: 'WATCH NEWS',
      body: 'Explore a virtual haven for news with our app—browse anytime, anywhere',
    ),
    BoardingModel(
      image: 'assets/onboarding_3.svg',
      title: 'BE FIRST TO KNOW',
      body: 'We will keep you informed of positive news and events',
    ),
  ];

  PageController boardingController = PageController();
  bool isLast = false;
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: boardingController,
              onPageChanged: (index) {
                if(index == boardingList.length - 1){
                  isLast = true;
                } else{
                  isLast = false;
                }
                if(index == 0){
                  isFirst = true;
                } else{
                  isFirst = false;
                }
              },
              itemBuilder: (context, index) => BoardingItem(
                boardingModel: boardingList[index],
              ),
              itemCount: boardingList.length,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SmoothPageIndicator(
                controller: boardingController,
                count: boardingList.length,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.orange,
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 3,
                  spacing: 5,
                ),
              ),
              const Spacer(),
              FloatingActionButton(
                heroTag: 'btn1',
                backgroundColor: Colors.orange,
                onPressed: (){
                  if(isFirst){} else{
                    boardingController.previousPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve:  Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              FloatingActionButton(
                heroTag: 'btn2',
                backgroundColor: Colors.orange,
                onPressed: (){
                  if(isLast == false){
                    boardingController.nextPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve:  Curves.fastLinearToSlowEaseIn,
                    );
                  } else{
                    CacheHelper.saveData(key: 'onBoarding', value: true).then((value){
                      if(value){
                        Navigator.pushReplacement(context,
                          CustomPageRoute(child: const HomePage(),
                        ),
                        );
                      }
                    });
                  }
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 32,
          // ),
        ],
      ),
    );
  }
}