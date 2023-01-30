import '../../shared/shared_theme/shared_colors.dart';
import '../../shared/shared_theme/shared_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
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
          'Category Item',
          style: SharedFonts.primaryBlackWhiteFont,
        ),
      ),
      body: ListView(children: [

        categoryItem('https://media.istockphoto.com/id/907874366/photo/doctor-urologist-shows-kidneys.jpg?s=612x612&w=0&k=20&c=sLirVwFWwoug5yxtunwgVGVREhX9tZPafEahStNA2ng=','Kidney Specialist'),
        categoryItem('https://media.istockphoto.com/id/474648404/photo/woman-doing-eye-test-with-optometrist.jpg?s=612x612&w=is&k=20&c=L6dzQl1KGwfrdLyQCm05b4igGFBKTw435L-CnkuvkxY=', 'Eyes Specialist'),
        categoryItem('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR_ufEu49E1cb_tDI339fCi6a_XCs1tJpDnw&usqp=CAU', 'Bone Specialist'),
      ]),
    );
  }

  categoryItem(String image,String txt) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Container(
            height: 195,
            margin: EdgeInsets.only(bottom: 7.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                image: DecorationImage(
                    image: NetworkImage(
                        '$image'),
                    fit: BoxFit.fill)),
            alignment: Alignment.topRight,
          ),
          Text('  $txt\n', style: SharedFonts.subBlackFont),
        ],
      ),
    );
  }
}
