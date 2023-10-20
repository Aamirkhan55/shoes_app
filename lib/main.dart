import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_app/screens/onBoarding/onoarding_screen.dart';
import 'package:shoes_app/screens/splash/splash_screen.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(1080, 2408),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoes App',
        home: SplashScreen(child: OnBoardingScreen()),
      ),
    );
  }
}
