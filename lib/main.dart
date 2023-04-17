import 'package:flutter/material.dart';
import 'package:shoes_app/screens/home_screen.dart';
import 'package:shoes_app/screens/logIn_Screen.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFCEDDEE)
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => const LogInScreen(),
        "homeScreen" : (context) => const HomeScreen(),
      },
    );
  }
}
