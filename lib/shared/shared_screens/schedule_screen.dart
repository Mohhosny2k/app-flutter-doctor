import '../../doctor/doctor_model.dart';
import '../shared_theme/shared_colors.dart';
import '../shared_theme/shared_fonts.dart';
import '../shared_widget/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen(this.doctor, {super.key});
  DoctorModel doctor;
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String cdate = DateFormat("dd-MMMM-yyy").format(DateTime.now());
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: SharedColors.whiteColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '  $cdate',
                          style: TextStyle(
                            color: SharedColors.yellowWhite,
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          ' Schedule',
                          style: SharedFonts.primaryBlackFont,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 85.h,
                      width: 78.w,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: SharedColors.pupleDark,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(
                              '${widget.doctor.images}',
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 74.h,
                child: TabBar(
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.all(7),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.grey.shade100,
                    isScrollable: true,
                    onTap: (index) {
                      setState(() {
                        value = index;
                      });
                    },
                    tabs: [
                      dataNumber(
                          0,
                          SharedColors.pupleDark,
                          SharedColors.greyColor,
                          '${widget.doctor.nameOneDay}',
                          '${widget.doctor.numSun}'),
                      dataNumber(
                          1,
                          SharedColors.pupleDark,
                          SharedColors.greyColor,
                          '${widget.doctor.nameTwoDay}',
                          '${widget.doctor.numMon}'),
                      dataNumber(
                          2,
                          SharedColors.pupleDark,
                          SharedColors.greyColor,
                          '${widget.doctor.nameThreeDay}',
                          ' ${widget.doctor.numTue}'),
                      dataNumber(
                          3,
                          SharedColors.pupleDark,
                          SharedColors.greyColor,
                          '${widget.doctor.nameFourDay}',
                          '${widget.doctor.numWed}'),
                      dataNumber(
                          4,
                          SharedColors.pupleDark,
                          SharedColors.greyColor,
                          '${widget.doctor.nameFiveDay}',
                          '${widget.doctor.numThu}'),
                      dataNumber(
                          5,
                          SharedColors.pupleDark,
                          SharedColors.greyColor,
                          'fri', //'${widget.doctor.nameSixDay}',
                          '${widget.doctor.numFri}'),
                      dataNumber(
                          6,
                          SharedColors.pupleDark,
                          SharedColors.greyColor,
                          '${widget.doctor.nameSevenDay}',
                          '${widget.doctor.numSat}'),
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  viewConculstion(() {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snack('${widget.doctor.messageOne}'));
                  }, '${widget.doctor.clockOne}', SharedColors.yellowBackGround,
                      SharedColors.yellowWhite),
                  viewConculstion(() {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snack('${widget.doctor.messageTwo}'));
                  }, '${widget.doctor.clockTwo}', SharedColors.pupleBackGround,
                      SharedColors.pupleWhite),
                  viewConculstion(
                    () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snack('${widget.doctor.messagethree}'));
                    },
                    '5 Am',
                    SharedColors.greenBackGround,
                    SharedColors.greenWhite,
                  ),
                  viewConculstion(() {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snack('${widget.doctor.messagefour}'));
                  }, '${widget.doctor.clockFour}',
                      SharedColors.orangeBackGround, SharedColors.orangeWhite),
                  viewConculstion(
                    () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snack('${widget.doctor.messageFive}'));
                    },
                    '8 PM',
                    SharedColors.maintBackGround,
                    SharedColors.greenWhite,
                  ),
                  Column(
                    children: [
                      ListTile(
                        leading: Text(
                          'List Of Schedule',
                          style: SharedFonts.primaryBlackFont,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snack('weekend'));
                        },
                        leading: Text(
                          '\n1 PM\n',
                          style: SharedFonts.subBlackFont,
                        ),
                        title: Container(
                          padding: EdgeInsets.all(.5),
                          margin: EdgeInsets.all(.5),
                          height: 70.h,
                          decoration: BoxDecoration(
                            color: SharedColors.greyColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '   Tap to request Schedule',
                                style: SharedFonts.subBlackFont,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  viewConculstion(() {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snack('${widget.doctor.messageSix}'));
                  }, '${widget.doctor.clockSeven}',
                      SharedColors.yellowBackGround, SharedColors.yellowWhite),
                ]),
              ),
            ]),
      ),
    );
  }

  Container dataNumber(
      int index, Color c1, Color c2, String nameData, String numberData) {
    return Container(
      height: 65.h,
      width: 58.w,
      decoration: BoxDecoration(
        color: value == index ? c1 : c2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(
          '$nameData',
          style: TextStyle(
              color: SharedColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp),
          maxLines: 1,
        ),
        subtitle: Text(
          ' $numberData',
          style: TextStyle(
              color: SharedColors.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Column viewConculstion(
      dynamic tab, String clock, Color cBackground, Color c1) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          leading: Text(
            'List Of Schedule',
            style: SharedFonts.primaryBlackFont,
          ),
        ),
        ListTile(
          onTap: tab,
          leading: Text(
            '\n$clock\n',
            style: SharedFonts.subBlackFont,
          ),
          title: Container(
            padding: EdgeInsets.all(.5),
            margin: EdgeInsets.all(.5),
            height: 70.h,
            decoration: BoxDecoration(
              color: cBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //ListTile(leading: Text(' Consultations',style: SharedFonts.subBlackFont,) ,),
                Text(
                  '    Consultations',
                  style: SharedFonts.subBlackFont,
                ),

                Container(
                  margin: EdgeInsets.all(22),
                  height: 48.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: c1, borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.add,
                    color: cBackground,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        //Text('data'),
      ],
    );
  }
}
