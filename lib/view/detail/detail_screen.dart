import 'package:flutter/material.dart';
import 'package:shoes_app/model/shoe_model.dart';
import 'package:shoes_app/utils/constants.dart';
import 'package:shoes_app/view/detail/components/appbar.dart';

class DetailScreen extends StatelessWidget {
  final ShoeModel model;
  final bool isComeFromSection;
  const DetailScreen({super.key, required this.model, required this.isComeFromSection});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: customAppBarDe(context),
        body: SizedBox(
          width: size.width,
          height: size.height * 1.1,
          child: Column(
            children: [
               Positioned(
                 right: 80,
                 bottom: 20,
                 child: Container(
                  width: size.width,
                  height: size.height / 2.3,
                  child: Stack(
                    children: [
                      Container(
                        width: 1000,
                        height: size.height/  2.2,
                        decoration: BoxDecoration(
                          color: model.modelColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(1500),
                            bottomRight: Radius.circular(100)
                          )
                        ),
                      )
                    ],
                  ),
                             ),
               )
            ],
          ),
        ),
      ));
  }
}