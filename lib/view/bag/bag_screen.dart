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
              _mainProductList(width, height),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainProductList(double width, double height) {
    return SizedBox(
              width: width,
              height: height * 0.8,
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
                                Container(
                                  width: width * 0.4,
                                  margin: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: currentBagItem.modelColor
                                        .withOpacity(0.9),
                                  ),
                                ),
                                Positioned(
                                  right: 2,
                                  bottom: 15,
                                  child: RotationTransition(
                                    turns: const AlwaysStoppedAnimation(
                                        -40 / 360),
                                    child: SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: Image(
                                          image: AssetImage(
                                              currentBagItem.imgAddress)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currentBagItem.model,
                                style: AppThemes.bagProductModel,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "\$${currentBagItem.price}",
                                style: AppThemes.bagProductPrice,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Todo
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        color: Colors.grey[350],
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.remove,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                 const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "1",
                                    style: AppThemes.bagProductNumOfShoe,
                                    ),
                                  ),
                                 GestureDetector(
                                    onTap: () {
                                      // Todo
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        color: Colors.grey[350],
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ), 
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
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
