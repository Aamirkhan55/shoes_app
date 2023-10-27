import 'package:flutter/material.dart';
import 'package:shoes_app/data/dummy_data.dart';
import 'package:shoes_app/theme/custom_app_theme.dart';
import 'package:shoes_app/utils/constants.dart';


class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  int lengthsofItemsOnBag = itemsOnBag.length;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          width: width,
          height: height,
          child: Column(
            children: [
              _bagAppBar(width, height)
            ],
          ),
        ),
      ),
    );
  }

  Widget _bagAppBar(double width, double height) {
    return SizedBox(
              width: width,
              height: height / 14,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Text(
                    'My Bag',
                    style: AppThemes.bagTitle,
                    ),
                  Text(
                    "Total $lengthsofItemsOnBag Items",
                    style: AppThemes.bagTotalPrice,
                  ), 
                ],
              ),
            );
  }
}