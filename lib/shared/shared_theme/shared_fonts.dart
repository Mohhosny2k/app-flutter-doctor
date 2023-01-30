import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared_colors.dart';
class SharedFonts {
    static final TextStyle primaryBlackFont = TextStyle(
      color: SharedColors.blackColor,
      letterSpacing: 3,
      fontSize: 24.0.sp,
      fontWeight: FontWeight.bold);
  static final TextStyle subBlackFont = TextStyle(
      color: SharedColors.blackColor,
      fontSize: 17.0.sp,
      fontWeight: FontWeight.bold);
  static final TextStyle subGreyFont = TextStyle(
      color: SharedColors.greyColor,
      fontSize: 15.0.sp,
      fontWeight: FontWeight.bold);
  static final TextStyle primaryGreyFont = TextStyle(
      color: SharedColors.greyColor,
      fontSize: 17.0.sp,
      fontWeight: FontWeight.bold);
   static final TextStyle primaryBlackWhiteFont = TextStyle(
      color: SharedColors.blackWhiteColor,
      fontSize: 20.0.sp,
      fontWeight: FontWeight.bold);
  static final TextStyle subBlackWhiteFont = TextStyle(
      color: SharedColors.blackWhiteColor,
      fontSize: 17.0.sp,
      fontWeight: FontWeight.bold);
}
