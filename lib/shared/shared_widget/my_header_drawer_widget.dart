import '../../doctor/doctor_views/all_doctor_screen.dart';
import '../shared_theme/shared_colors.dart';
import '../shared_theme/shared_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../user/user_views/notification_screen.dart';
class MyHeaderDrawerWidget extends StatefulWidget {
  const MyHeaderDrawerWidget({super.key});

  @override
  State<MyHeaderDrawerWidget> createState() => _MyHeaderDrawerWidgetState();
}

class _MyHeaderDrawerWidgetState extends State<MyHeaderDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(21),
            height: 90.h,
            width: 82.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(
                      'https://scontent.fcai19-6.fna.fbcdn.net/v/t39.30808-6/290726733_5104915729626986_2964362958934626471_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=k7A5kXAWpJMAX84zDzI&_nc_oc=AQnLcnPrzQQ2pCn4aLjcfCc8eapJLV5ZOvByes5wlDYPQ3vEcJ34ha_nqDf5FbKoQ0o&_nc_ht=scontent.fcai19-6.fna&oh=00_AfCUjWDZJ429ggBEdhJaRFrTPmMZMKCXf8iWABjDw5wQyg&oe=63D8C6D3',
                    ),
                    fit: BoxFit.fill),
                //shape: BoxShape.circle,
                color: SharedColors.greenBackGround),
          ),
          Text(
            'Mohamed Hosny',
            style: TextStyle(
                color: SharedColors.blackColor, fontSize: 19.sp, height: 1.sp),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            "mohhosny2k@gmail.com",
            style: TextStyle(
              color: SharedColors.blackWhiteColor,
              height: 1.sp,
              fontSize: 12.sp,
            ),
          ),
          Divider(
            height: 10,
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: SharedColors.greyColor,
          ),
          ListTile(
              leading: Icon(Icons.rule_folder),
              title: Text('Rules'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>NotificationScreen()));
              }),
          ListTile(
             onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AllDoctorScreen()));
              },
            leading: Icon(Icons.medical_information_outlined),
            title: Text('Go doctors'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.settings_backup_restore_outlined),
            title: Text('History'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          // SizedBox(
          //   height: 200.h,
          // ),
          // Align(
          //  alignment: Alignment.bottomLeft,
          //   child: ListTile(
          //     leading: Icon(Icons.logout_sharp),
          //     title: Text('Log out'),
          //   ),
          // ),
        ]);
  }
}