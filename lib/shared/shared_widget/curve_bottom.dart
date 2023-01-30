import 'dart:math';
import 'package:flutter/material.dart';
import 'curve_top.dart';
class CurveBottom extends StatelessWidget {
  const CurveBottom();
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: ( 180 *(pi/180)),
        child: CurveTop());
  }
}