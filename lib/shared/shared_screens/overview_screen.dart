import '../../doctor/doctor_model.dart';
import 'home_screen.dart';
import 'schedule_screen.dart';
import 'package:flutter/material.dart';
import '../shared_theme/shared_colors.dart';
import '../shared_theme/shared_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../doctor/doctor_controller.dart';

class OverviewScreen extends StatefulWidget {
  OverviewScreen(this.doctor, {super.key});
  DoctorModel doctor;
  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 25),
            height: 300.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                Container(
                  child: Column(children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back)),
                    SizedBox(
                      height: 26.h,
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ScheduleScreen(widget.doctor)));
                        },
                        child: Text(
                          "Schedule",
                          style: SharedFonts.primaryGreyFont,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text("Overview",
                          style: TextStyle(
                              color: SharedColors.yellowWhite,
                              fontSize: 20.sp)),
                    ),
                  ]),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 30),
                    decoration: BoxDecoration(
                      color: SharedColors.pupleDark, //Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage('${widget.doctor.images}'),
                        // AssetImage('assets/images/klipartz.com (1).png'),https://www.carehospitals.com/indore/assets/images/main/general-surgeon-aalok-somani.webp
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text('   ${widget.doctor.nameDoctor}',
              style: TextStyle(
                  height: 2.h,
                  color: SharedColors.blackColor,
                  fontSize: 22.sp)),
          Container(
            padding: EdgeInsets.only(top: 8),
            margin: EdgeInsets.only(left: 20, top: 10),
            height: 35.h,
            width: 108.w,
            decoration: BoxDecoration(
                color: SharedColors.yellowBackGround,
                borderRadius: BorderRadius.circular(6)),
            child: Text(
              '  ${widget.doctor.spcName}',
              style: TextStyle(
                  color: SharedColors.yellowDark,
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text('    Get Closer with me',
              style: TextStyle(
                  height: 2.h,
                  color: SharedColors.blackColor,
                  fontSize: 20.sp)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Teaching in kindergarten includes planning, implementing and assessing lessons. You will teach children with patience and creativity. Kindergarten Teacher duties include designing a teaching plan and using activities and instructional methods to motivate children.',
              softWrap: true,
              maxLines: 4,
              style: TextStyle(height: 1.5.h),
            ),
          ),
          Container(
            margin: EdgeInsets.all(3),
            padding: EdgeInsets.only(
              left: 12,
              top: 2,
            ),
            height: 88.h,
            //color: Colors.amber,
            child: Row(
              children: [
                categoriesItem(SharedColors.greenWhite, SharedColors.greenDark,
                    'Patient    ', '${widget.doctor.numPatient}K     ',(){}),
                categoriesItem(
                    SharedColors.yellowWhite,
                    SharedColors.yellowDark,
                    'EXperience ',
                    '${widget.doctor.experience} Years ',(){}),
                categoriesItem(
                    SharedColors.orangeWhite,
                    SharedColors.orangeDark,
                    'Rating    ',
                    '${widget.doctor.rating}     ',(){}),
                // Container(
                //   padding: EdgeInsets.only(top: 6.3, left: 6),
                //   margin: EdgeInsets.only(left: 3, right: 13),
                //   height: 85.h,
                //   width: 91.w,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: SharedColors.greenWhite),
                //   child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.end,
                //       children: [
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             Text(
                //               'Patient       ',
                //               style: TextStyle(
                //                  //height: 1,
                //                   color: SharedColors.whiteColor,
                //                   fontSize: 16.sp),
                //             ),
                //             Text('10K   ',
                //                 style: TextStyle(
                //                   height: .9.h,
                //                     color: SharedColors.whiteColor,
                //                     fontSize: 17.sp)),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 4.h,
                //           width: 5.w,
                //         ),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           children: [
                //             Container(
                //               alignment: Alignment.bottomRight,
                //               padding: EdgeInsets.only(left: 9),
                //               height: 40.h,
                //               width: 47.w,
                //               decoration: BoxDecoration(
                //                   color: SharedColors
                //                       .greenDark, // Colors.blueAccent,
                //                   borderRadius: BorderRadius.only(
                //                       topLeft: Radius.circular(25),
                //                       bottomRight: Radius.circular(25))),
                //             ),
                //           ],
                //         ),
                //       ]),
                // ),
                // Container(
                //   padding: EdgeInsets.only(top: 6.3, left: 8.3),
                //   margin: EdgeInsets.only(
                //     right: 13,
                //     left: 3,
                //   ),
                //   height: 85.h,
                //   width: 91.w,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: SharedColors.yellowWhite),
                //   child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.end,
                //       children: [
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             Text(
                //               'EXperience    ',
                //               style: TextStyle(
                //                  height: 1.h,
                //                   color: SharedColors.whiteColor,
                //                   fontSize: 16.sp),
                //             ),
                //             Text('3 Years   ',
                //                 style: TextStyle(
                //                    height: 1.h,
                //                     color: SharedColors.whiteColor,
                //                     fontSize: 16.sp)),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 4.h,
                //           width: 5.w,
                //         ),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           children: [
                //             Container(
                //               alignment: Alignment.bottomRight,
                //               padding: EdgeInsets.only(left: 9),
                //               height: 40.h,
                //               width: 47.w,
                //               decoration: BoxDecoration(
                //                   color: SharedColors
                //                       .yellowDark, // Colors.blueAccent,
                //                   borderRadius: BorderRadius.only(
                //                       topLeft: Radius.circular(25),
                //                       bottomRight: Radius.circular(25))),
                //             ),
                //           ],
                //         ),
                //       ]),
                // ),
                // Container(
                //   alignment: Alignment.center,
                //   padding: EdgeInsets.only(top: 6.3, left: 8.5),
                //   margin: EdgeInsets.only(
                //     left: 3,
                //   ),
                //   height: 85.h,
                //   width: 91.w,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: SharedColors.orangeWhite),
                //   child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.end,
                //       children: [
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             Text(
                //               'Rating        ',
                //               style: TextStyle(
                //                   color: SharedColors.whiteColor,
                //                   fontSize: 16.sp),
                //             ),
                //             Text('4.5   ',
                //                 style: TextStyle(
                //                    height: 1.h,
                //                     color: SharedColors.whiteColor,
                //                     fontSize: 16.sp)),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 4.2.h,
                //           width: 7.w,
                //         ),
                //         Row(
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           children: [
                //             SizedBox(width: 34.w,),
                //             Container(
                //               alignment: Alignment.bottomRight,
                //               padding: EdgeInsets.only(left: 10.5),
                //               height: 40.h,
                //               width: 48.w,
                //               decoration: BoxDecoration(
                //                   color: SharedColors
                //                       .orangeDark, // Colors.blueAccent,
                //                   borderRadius: BorderRadius.only(
                //                       topLeft: Radius.circular(25),
                //                       bottomRight: Radius.circular(25))),
                //             ),
                //           ],
                //         ),
                //       ]),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
