import '../doctor_model.dart';
import '../../shared/shared_screens/overview_screen.dart';
import '../../shared/shared_theme/shared_colors.dart';
import '../../shared/shared_theme/shared_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../doctor_controller.dart';
import '../doctor_states.dart';
import 'package:flutter/material.dart';

class AllDoctorScreen extends StatefulWidget {
  const AllDoctorScreen({super.key});

  @override
  State<AllDoctorScreen> createState() => _AllDoctorScreenState();
}

class _AllDoctorScreenState extends State<AllDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorController, DoctorState>(
      builder: (context, state) {
        if (state is GetDoctorLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetDoctorErrorState) {
          return Center(
            child: Text('Some thing went wrong',
                style: SharedFonts.primaryBlackFont),
          );
        } else {
          return BlocBuilder<DoctorController, DoctorState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: SharedColors.backGroundColor,
                appBar: AppBar(
                  elevation: 0,
                  leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: SharedColors.blackColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      iconSize: 24.sp),
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: Text(
                    'Doctor Screen',
                    style: SharedFonts.primaryBlackWhiteFont,
                  ),
                ),
                body: Column(children: [
                  SafeArea(
                    top: true,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: Text(
                          ' ${BlocProvider.of<DoctorController>(context).allldoctor.length} Items',
                          style: SharedFonts.subBlackFont),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: BlocProvider.of<DoctorController>(context)
                          .allldoctor
                          .length,
                      itemBuilder: (context, index) => item(
                          BlocProvider.of<DoctorController>(context)
                              .allldoctor[index]),

                      // Test(
                      //     BlocProvider.of<DoctorController>(context)
                      //         .alllbeverages[index]),
                    ),
                  )
                ]),
              );
            },
          );
        }
      },
    );
  }

  item(DoctorModel doctor) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>OverviewScreen(doctor)));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 85.h,
        decoration: BoxDecoration(
          color: SharedColors.pupleBackGround,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 3),
              height: 75.h,
              width: 75.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: SharedColors.pupleDark,
                  image: DecorationImage(
                    image: AssetImage('${doctor.images}'),
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
                  ' ${doctor.rating}.0 ',
                  style: TextStyle(color: SharedColors.whiteColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 18, left: 13, right: 1, bottom: 18),
              child: SizedBox(
                width: 150.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' ${doctor.nameDoctor}',

                      //style: SharedFonts.subBlackFont,

                      style: TextStyle(
                          color: SharedColors.blackColor,
                          fontSize: 15.sp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(' ${doctor.spcName}', style: SharedFonts.subBlackFont),
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
  }
}
