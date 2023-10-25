import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            _mainShoeListView(size),
            _moreTextIcon(),
            SizedBox(
              width: size.width,
              height: size.height * 0.28,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: availableShoes.length,
                itemBuilder: (context, index) {
                  ShoeModel model = availableShoes[index];
                  return Container(
                    margin: const EdgeInsets.all(10),
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 4,
                          child: Container(
                            width: size.width / 13,
                            height: size.height / 10,
                            color: Colors.red,
                            child: const RotatedBox(
                              quarterTurns: -1,
                              child: Center(
                                child: Text(
                                  'NEW',
                                  style: AppThemes.homeGridNewText,
                                  ),
                              ),
                              ),
                          ),
                        ),
                        Positioned(
                          right: 1,
                          child: IconButton(
                            onPressed: (){}, 
                            icon: const Icon(
                              Icons.favorite_border,
                              color: AppConstantsColor.darkTextColor,
                              )
                            ),
                          ), 
                        Positioned(
                          top: 40,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(-20 / 360),
                            child: Hero(
                              tag: model.model, 
                              child: Image(
                                image: AssetImage(model.imgAddress),
                                width: size.width * 0.45,
                                )
                              ),
                            )
                          ), 
                         Positioned(
                          bottom: 35,
                          left: 45,
                          child: SizedBox(
                            width: size.width / 4,
                            height: size.height / 42,
                            child: FittedBox(
                              child: Text(
                                '${model.name} ${model.name}',
                                style: AppThemes.homeGridNameAndModel,
                                ),
                            ),
                          )
                          )    
                      ],
                    ),
                  );
                }),
            )
          ],
        ),
      ),
    );
  }

  Padding _moreTextIcon() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'More',
                  style: AppThemes.homeMoreText,
                  ),
                IconButton(
                  onPressed: () {}, 
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    size: 30,
                    )
                  )  
              ],
            ),
          );
  }

  Row _mainShoeListView(Size size) {
    return Row(
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
                              ),
                            Positioned(
                              top: 40,
                              left: 10,
                              child: Text(
                                model.model,
                                style: AppThemes.homeProductModel,
                                )
                              ),
                            Positioned(
                              top: 70,
                              left: 10,
                              child: Text( "\$${model.price.toStringAsFixed(2)}",
                                style: AppThemes.homeProductPrice,
                                )
                              ),
                            Positioned(
                              right: 15,
                              top: 50,
                              child: RotationTransition(
                                turns: const AlwaysStoppedAnimation(-30 / 360),
                                child: SizedBox(
                                  width: 220,
                                  height: 220,
                                  child: Image(image: AssetImage(model.imgAddress)),
                                ),
                                ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 160,
                              child: IconButton(
                                onPressed: () {}, 
                                icon: const FaIcon(
                                  size: 25,
                                  color: Colors.white,
                                  FontAwesomeIcons.circleArrowRight,
                                  ),
                                )),        
                          ],
                        ),
                      ),
                    );
                  }),
              )
            ],
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
