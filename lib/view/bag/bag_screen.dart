import 'package:flutter/material.dart';
import 'package:shoes_app/data/dummy_data.dart';
import 'package:shoes_app/model/model.dart';
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
              _bagAppBar(width, height),
              Container(
                width: width,
                height: height * 0.8,
                color: Colors.red,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: itemsOnBag.length,
                  itemBuilder: (context, index) {
                    ShoeModel currentBagItem = itemsOnBag[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      width: width,
                      height: height * 0.2,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.4,
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 2,
                                  child: Container(
                                    width: width / 0.4,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey[350],
                                    ),
                                  ),
                                ),
                              Positioned(
                                right: 2,
                                bottom: 15,
                                child: RotationTransition(
                                  turns: const AlwaysStoppedAnimation(-40 / 360),
                                  child: SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Image(image: AssetImage(currentBagItem.imgAddress)),
                                  ),
                                  )
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  ),
              ),
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
