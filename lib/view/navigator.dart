import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
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
        ]
        ),
    );
  }
}