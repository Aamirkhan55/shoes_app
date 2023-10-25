import 'package:flutter/material.dart';
import 'package:shoes_app/utils/constants.dart';
import 'package:shoes_app/view/detail/components/appbar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: customAppBarDe(context),
      ));
  }
}