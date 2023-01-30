import '../shared_widget/curve_bottom.dart';
import '../shared_widget/curve_top.dart';
import 'home_screen.dart';
import 'overview_screen.dart';
import '../shared_theme/shared_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String? image;
  final String? title;
  final String? body;
  final String? bottom;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
    required this.bottom,
  });
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});
  var boradControl = PageController();
  bool isLast = false;
  List<BoardingModel> boardingList = [
    BoardingModel(
      image: 'assets/images/onboardingone.png',
      title: 'Get accurate medical reports from a specialized doctor',
      body:
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected',
      bottom: 'Lets Go',
    ),
    BoardingModel(
        image: 'assets/images/onboardingtwo.png',
        title: 'Schedule a session with your specialist doctor',
        body:
            'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected',
        bottom: 'Continue'),
    BoardingModel(
        image: 'assets/images/onboardingthree.png',
        title: 'Get medical tests done with the best doctors',
        body:
            'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected',
        bottom: 'Lets Start'),
  ];
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      body: PageView.builder(
        onPageChanged: (int index) {
          if (index == widget.boardingList.length - 1) {
            setState(() {
              widget.isLast = true;
            });
            print('last');
          } else {
            print('no last');
            setState(() {
              widget.isLast = false;
            });
          }
        },
        controller: widget.boradControl,
        itemBuilder: (context, index) =>
            BuildBoradingScreen(widget.boardingList[index]),
        itemCount: widget.boardingList.length,
      ),
    );
  }

  Widget BuildBoradingScreen(BoardingModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CurveTop(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('${model.image}'),
        )),
        Text(
          '${model.title}',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: SharedColors.blackColor),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          '${model.body}',
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  child: Text(
                    'skip',
                    style: TextStyle(
                      color: SharedColors.blackColor,
                      fontSize: 20.0,
                    ),
                  )),
              SmoothPageIndicator(
                controller: widget.boradControl,
                count: widget.boardingList.length,
                effect: ExpandingDotsEffect(
                    activeDotColor: SharedColors.pupleDark,
                    dotColor: SharedColors.pupleWhite,
                    dotHeight: 10.h,
                    expansionFactor: 4,
                    dotWidth: 10.w,
                    spacing: 5),
              ),
              // Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: SharedColors.pupleBackGround,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fixedSize: Size(100, 50),
                ),
                onPressed: () {
                  if (widget.isLast) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) =>HomeScreen()));
                  } else {
                    widget.boradControl.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                child: Text(
                  '${model.bottom}',
                  style: TextStyle(color: SharedColors.blackColor),
                ),
              ),
            ],
          ),
        ),
        CurveBottom()
      ],
    );
  }
}
