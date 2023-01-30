import '../shared_theme/shared_colors.dart';
import '../shared_theme/shared_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class CurveTop extends StatefulWidget {
  const CurveTop({super.key});

  @override
  State<CurveTop> createState() => _CurveTopState();
}

class _CurveTopState extends State<CurveTop> {
  final double heightRatio = .14;
  final double opacityHeightRatio = .02;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height*(heightRatio+opacityHeightRatio),
        width: MediaQuery.of(context).size.width
      ),
      child: Stack(
        children: [
          // with opacity
          ClipPath(
            child: Container(
              height: MediaQuery.of(context).size.height *(heightRatio+opacityHeightRatio),
              color: SharedColors.pupleDark.withOpacity(.4),
            ),
            clipper: CustomClipPath(),
          ),
          ClipPath(
            child: Container(
              height:MediaQuery.of(context).size.height *heightRatio,
              color:SharedColors.pupleDark ,
            ),
            clipper: CustomClipPath(),
          ),
        ],
      ),
    );
  }
}


class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4, size.height
 - 40, size.width/2, size.height-20);
    path.quadraticBezierTo(3/4*size.width, size.height,
 size.width, size.height-30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}