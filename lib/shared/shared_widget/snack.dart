import '../shared_theme/shared_colors.dart';
import 'package:flutter/material.dart';

SnackBar snack(String content, ) {
  return SnackBar(
    content: Text('$content', style: TextStyle(color:SharedColors.blackWhiteColor)),
    duration: Duration(seconds:5),
    backgroundColor: SharedColors.greenDark,
  );
}
