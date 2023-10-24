import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/data/dummy_data.dart';
import 'package:shoes_app/model/shoe_model.dart';
import 'package:shoes_app/theme/custom_app_theme.dart';
import 'package:shoes_app/utils/constants.dart';
import 'package:shoes_app/view/home/components/appBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndexOfCategory = 0;
  int _selectedIndexOfFeature = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: customAppBar(),
        body: Column(
          children: [
            _categoryView(size),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  width: size.width / 16,
                  height: size.height / 2.4,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: featured.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndexOfFeature = index;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              child: Text(featured[index],
                                  style: TextStyle(
                                    fontSize: _selectedIndexOfFeature == index
                                        ? 21
                                        : 18,
                                    color: _selectedIndexOfFeature == index
                                        ? AppConstantsColor.darkTextColor
                                        : AppConstantsColor.unSelectedTextColor,
                                    fontWeight:_selectedIndexOfFeature == index
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  )),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.89,
                  height: size.height * 0.4,
                  child: ListView.builder(
                    scrollDirection:  Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: availableShoes.length,
                    itemBuilder: (context, index) {
                      ShoeModel model = availableShoes[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.005,
                            vertical: size.height * 0.01,
                          ),
                          width: size.width / 1.6,
                          child: Stack(
                            children: [
                              Container(
                                width: size.width/1.81,
                                decoration:  BoxDecoration(
                                  color: model.modelColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                             Positioned(
                                left: 10,
                                child: Row(
                                  children: [
                                  Text(
                                    model.name,
                                    style: AppThemes.homeProductName,
                                    ),
                                   SizedBox(
                                    width: size.width * 0.3,
                                  ),
                                  IconButton(
                                    onPressed: () {}, 
                                    icon: const Icon(
                                      CupertinoIcons.heart,
                                      color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                                )
                            ],
                          ),
                        ),
                      );
                    }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _categoryView(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.04,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndexOfCategory = index;
                    });
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Text(categories[index],
                        style: TextStyle(
                          fontSize: _selectedIndexOfCategory == index ? 21 : 18,
                          color: _selectedIndexOfCategory == index
                              ? AppConstantsColor.darkTextColor
                              : AppConstantsColor.unSelectedTextColor,
                          fontWeight: _selectedIndexOfCategory == index
                              ? FontWeight.w600
                              : FontWeight.w400,
                        )),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
