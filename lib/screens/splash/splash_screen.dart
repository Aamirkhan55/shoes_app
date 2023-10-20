import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget child;
  const SplashScreen({super.key, required this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000)).then((value) =>
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => widget.child),
            (route) => false));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/Splash.png',
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.fitWidth,
          ),
          const Positioned(
            bottom: 20,
            left: 40,
            child: Text(
              'Oxy Boots...',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
