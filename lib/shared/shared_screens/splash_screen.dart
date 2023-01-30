import 'onboarding_screen.dart';
import '../shared_theme/shared_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  bool first = true;
  @override
  void didChangeDependencies() async {
    if (first) {
      first = false;
      await Future.delayed(Duration(seconds: 5), () async {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => OnBoardingScreen()));
      });
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.pupleDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Icon(
            Icons.heart_broken,
            color: SharedColors.blackWhiteColor,
            size: 200.sp,
          )),
          Text('Doctor Consultation',
              style: TextStyle(
                color: SharedColors.whiteColor,
                fontSize: 30.sp,
              )),
        ],
      ),
    );
  }
}
