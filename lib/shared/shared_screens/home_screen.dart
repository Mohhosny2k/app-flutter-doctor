import '../../doctor/doctor_views/all_category_screen.dart';
import '../../doctor/doctor_views/bone_screen.dart';
import '../../doctor/doctor_views/eyes_screen.dart';
import '../../doctor/doctor_views/kidney_screen.dart';
import '../shared_widget/my_header_drawer_widget.dart';
import 'overview_screen.dart';
import '../shared_theme/shared_colors.dart';
import '../shared_theme/shared_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../doctor/doctor_controller.dart';
import '../../doctor/doctor_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: SharedColors.backGroundColor,
        child: MyHeaderDrawerWidget(),
      ),
      backgroundColor: SharedColors.whiteColor,
      appBar: AppBar(
        leading: null,
        iconTheme: IconThemeData(color: SharedColors.blackColor),
        toolbarHeight: 79.h,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: appbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0), //21
        child: Column(//padding: EdgeInsets.all(2),
            children: [
          categorySection(),
          SizedBox(
            height: 10.h,
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                circRow(0, SharedColors.yellowWhite, SharedColors.greyColor),
                circRow(
                  1,
                  SharedColors.yellowWhite,
                  SharedColors.greyColor,
                ),
                circRow(
                  2,
                  SharedColors.yellowWhite,
                  SharedColors.greyColor,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AllCategoryScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '  Categories',
                  style: SharedFonts.subBlackFont,
                ),
                Text(
                  'More',
                  style: SharedFonts.subBlackFont,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(1),
            height: 86.h,
            //width: 85.w,
            //color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoriesItem(SharedColors.greenWhite, SharedColors.greenDark,
                    'Bona', 'specialist', () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => BoneScreen()));
                }),
                categoriesItem(SharedColors.yellowWhite,
                    SharedColors.yellowDark, 'Eyes', 'specialist', () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => EyesScreen()));
                }),
                categoriesItem(SharedColors.orangeWhite,
                    SharedColors.orangeDark, 'Kidney', 'specialist', () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => KidneyScreen()));
                }),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '  Top Rated Doctor',
                style: SharedFonts.subBlackFont,
              ),
              Text(
                'More',
                style: SharedFonts.subBlackFont,
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          ratedSection(),
        ]),
      ),
    );
  }

  Container circRow(int index, Color c1, Color c2) {
    return Container(
      margin: EdgeInsets.all(4),
      height: 10.h,
      width: 8.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: value == index ? c1 : c2,
      ),
    );
  }

  categorySection() {
    return BlocBuilder<DoctorController, DoctorState>(
        builder: (context, state) {
      if (state is GetCategoryLoadingState) {
        return Center(child: CircularProgressIndicator());
      } else if (state is GetCategoryErrorState) {
        return Center(
            child: Text('Some thing went wrong',
                style: SharedFonts.primaryBlackFont));
      } else {
        return SizedBox(
          height: 191.h, // 193.h,
          width: double.infinity,
          child: PageView.builder(
            onPageChanged: (int index) {
              print(index);
              setState(() {
                value = index;
              });
            },
            scrollDirection: Axis.horizontal,
            itemCount:
                BlocProvider.of<DoctorController>(context).allcategory.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                margin: EdgeInsets.all(5),
                height: 180.h,
                width: 170.w,
                decoration: BoxDecoration(
                    color: SharedColors.pupleWhite,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              children: [
                                Text(
                                  '${BlocProvider.of<DoctorController>(context).allcategory[index].nameDectorFirst}',
                                  style: TextStyle(
                                      color: SharedColors.whiteColor,
                                      fontSize: 25.sp),
                                ),
                                Text(
                                  ' ${BlocProvider.of<DoctorController>(context).allcategory[index].nameDectorSecond}',
                                  style: TextStyle(
                                      color: SharedColors.whiteColor,
                                      fontSize: 25.sp),
                                ),
                                Text(
                                  '${BlocProvider.of<DoctorController>(context).allcategory[index].specialist}\n',
                                  style: TextStyle(
                                      color: SharedColors.whiteColor,
                                      fontSize: 14.sp,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            //padding: EdgeInsets.only(left: 2),
                            margin: EdgeInsets.only(top: 7),
                            height: 50.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: SharedColors
                                    .pupleDark, // Colors.blueAccent,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25))),
                            child: Center(
                                child: Icon(
                              Icons.arrow_forward_outlined,
                              size: 15.sp,
                              color: SharedColors.whiteColor,
                            )),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              //  color: Colors.red,
                              image: DecorationImage(
                            image: //https://pngimg.com/uploads/doctor/small/doctor_PNG16023.png
                                NetworkImage(
                              '${BlocProvider.of<DoctorController>(context).allcategory[index].image}',
                            ),
                            fit: BoxFit.fill,
                          )),
                        ),
                      ),
                    ]),
              );
            },
          ),
        );
      }
    });
  }

  ratedSection() {
    return BlocBuilder<DoctorController, DoctorState>(
      builder: (context, state) {
        if (state is GetTopLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetTopErrorState) {
          return Center(
              child: Text('Some thing went wrong',
                  style: SharedFonts.primaryBlackFont));
        } else {
          return Flexible(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount:
                  BlocProvider.of<DoctorController>(context).allltop.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => OverviewScreen(
                                  BlocProvider.of<DoctorController>(context)
                                      .allltop[index],
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    height: 85.h,
                    decoration: BoxDecoration(
                      color: SharedColors.pupleBackGround,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(top: 2), //3
                          height: 75.h,
                          width: 75.w, //75
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: SharedColors.pupleDark,
                              image: DecorationImage(
                                image: AssetImage(
                                    '${BlocProvider.of<DoctorController>(context).allltop[index].images}'),
                              )),
                          child: Container(
                            height: 16.h,
                            width: 25.w,
                            padding: EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                              color: SharedColors.yellowDark,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              ' ${BlocProvider.of<DoctorController>(context).allltop[index].rating} ',
                              style: TextStyle(color: SharedColors.whiteColor),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 18, left: 16, right: 13, bottom: 18),
                          child: SizedBox(
                            width: 150.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' ${BlocProvider.of<DoctorController>(context).allltop[index].nameDoctor}',
                                  style: TextStyle(
                                      color: SharedColors.blackColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    ' ${BlocProvider.of<DoctorController>(context).allltop[index].spcName}',
                                    style: SharedFonts.subBlackFont),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(22),
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                                color: SharedColors.pupleWhite,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.message,
                              color: SharedColors.yellowBackGround,
                              size: 24.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}

Column appbar() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
      padding: const EdgeInsets.only(top: 0), //18
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Doctor',
              style: TextStyle(
                color: SharedColors.blackWhiteColor,
                fontSize: 33.sp,
              )),
        ],
      ),
    ),
    Text(
      'Consultation',
      style: TextStyle(
        color: SharedColors.blackWhiteColor,
        fontSize: 33.sp,
      ),
    )
  ]);
}

categoriesItem(Color c1, Color c2, String txt1, String txt2, dynamic tab) {
  return InkWell(
    onTap: tab,
    child: Container(
      padding: EdgeInsets.only(top: 6, left: 8),
      margin: EdgeInsets.only(left: 3, right: 13),
      height: 85.h, //85
      width: 91.w,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: c1),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$txt1   ',
                  style: TextStyle(
                      color: SharedColors.whiteColor, fontSize: 16.sp),
                ),
                Text('$txt2   ',
                    style: TextStyle(
                        color: SharedColors.whiteColor, fontSize: 16.sp)),
              ],
            ),
            SizedBox(
              height: 3.h,
              width: 4.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(left: 9),
                  height: 38.5.h,
                  width: 47.w,
                  decoration: BoxDecoration(
                      color: c2, // Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                ),
              ],
            ),
          ]),
    ),
  );
}
