import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants.dart';
import 'package:shoes_app/view/home/home_screen.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int _selectIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> _screen = [
    const HomeScreen(),
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.teal,
    ),
    Container(
      color: Colors.cyan,
    ),
  ];

  void onItemTep(int index) {
    setState(() {
      _selectIndex = index;
    });
    _pageController.animateToPage(
      _selectIndex,
      duration: const Duration(milliseconds: 200), 
      curve: Curves.linear,
      );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screen,
      ),
      bottomNavigationBar: CustomNavigationBar(
          iconSize: 27.0,
          scaleFactor: 0.1,
          onTap: onItemTep,
          bubbleCurve: Curves.linear,
          currentIndex: _selectIndex,
          backgroundColor: Colors.white,
          selectedColor: AppConstantsColor.materialButtonColor,
          strokeColor: AppConstantsColor.materialButtonColor,
          unSelectedColor: const Color(0xffacacac),
          items: [
            CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.home),
            ),
            CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.cart),
            ),
            CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.person),
            ),
          ]),
    );
  }
}
