import 'doctor/doctor_controller.dart';
import 'shared/shared_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context,  child) {
         return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>DoctorController()),
          ],
           child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home:SplashScreen(),
                 ),
         );
      },
    );
  }
}
