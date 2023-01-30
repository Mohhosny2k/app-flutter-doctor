import '../../shared/shared_theme/shared_colors.dart';
import '../../shared/shared_theme/shared_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}
class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: SharedColors.greyColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Rules',
          style: SharedFonts.primaryBlackFont,
        ),
        centerTitle: true,
      ),
      body: ListView(padding: EdgeInsets.all(10), children: [
        Text(
          'All rules\n',
          style: SharedFonts.subBlackFont,
        ),
        Container(
          height: 140.h,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: SharedColors.pupleWhite,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Advanced Doctors\n',
              style: SharedFonts.subBlackFont,
            ),
            Text(
              'Beneficiary Engagement"',
              style: SharedFonts.subGreyFont,
            ),
            Text(
              'Evidenced-based Medicine',
              style: SharedFonts.subGreyFont,
            ),
            Text(
              'Care Plan Coordination',
              style: SharedFonts.subGreyFont,
            ), 
          ]),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 140.h,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:SharedColors.pupleDark,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Rules Doctor\n',
              style: SharedFonts.subBlackFont,
            ),
            Text(
              'Your booking at Specfition',
              style: SharedFonts.subGreyFont,
            ),
            Text(
              'Successfully verified',
              style: SharedFonts.subGreyFont,
            ),
            Text(
              '24.01.2023',
              style: SharedFonts.subGreyFont,
            ),
          ]),
        ),
      ]),
    );
  }
}
