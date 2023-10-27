import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoes_app/data/dummy_data.dart';
import 'package:shoes_app/model/shoe_model.dart';
import 'package:shoes_app/theme/custom_app_theme.dart';
import 'package:shoes_app/utils/constants.dart';
import 'package:shoes_app/view/detail/components/appbar.dart';

class DetailScreen extends StatefulWidget {
  final ShoeModel model;
  final bool isComeFromSection;
  const DetailScreen(
      {super.key, required this.model, required this.isComeFromSection});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isCounterySelected = false;
  int? _isSelectedSize;
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _topProducteImgBg(size),
              _morePicOfProduct(size),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _productNameAndPrice(),
                    _productInfo(size.width, size.height),
                    _moreDetailsText(size.width, size.height),
                    _sizeAndCategorySelectedSection(size),
                    _bottomSizeSelection(size),
                    _addToBagButton(size),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget _addToBagButton(Size size) {
    return Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: MaterialButton(
                      minWidth: size.width / 1.2,
                      height: size.height / 15,
                      color: widget.model.modelColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Add To Bag',
                        style: TextStyle(
                          color: AppConstantsColor.lightTextColor
                        ),
                        ),
                      )
                    ),
                  );
  }

  Widget _bottomSizeSelection(Size size) {
    return SizedBox(
                  width: size.width,
                  height: size.height * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width / 4.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1
                          ),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Try It',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                                ),
                              SizedBox(width: 10),
                              RotatedBox(
                                quarterTurns: -1,
                                child: FaIcon(FontAwesomeIcons.shoePrints), 
                                ),  
                            ],
                          ),
                        ),
                      ),
                     SizedBox(
                      width: size.width * 0.7,
                      child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _isSelectedSize = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                right: 5,
                                left: 5,
                                ),
                              width: size.width * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: _isSelectedSize == index ? Colors.black : Colors.grey,
                                  width: 1.5,
                                ),
                                color: _isSelectedSize == index ?  Colors.black : AppConstantsColor.backgroundColor ,
                              ),
                              child: Center(
                                child: Text(
                                  sizes[index].toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                     color: _isSelectedSize == index ? Colors.white : Colors.grey, 
                                  ),
                                  ),
                              ),
                            ),
                          );
                        }
                        ),
                     ) 
                    ],
                  ),
                );
  }

  Widget _sizeAndCategorySelectedSection(Size size) {
    return Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Size',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppConstantsColor.darkTextColor,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.35,
                        height: size.height * 0.05,
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isCounterySelected = false;
                                  });
                                },
                                child: Text(
                                  'Uk',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: _isCounterySelected
                                        ? FontWeight.w400
                                        : FontWeight.bold,
                                    color: _isCounterySelected
                                        ? Colors.grey
                                        : AppConstantsColor.darkTextColor,
                                  ),
                                ),
                                ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isCounterySelected = true;
                                  });
                                },
                                child: Text(
                                  'USA',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: _isCounterySelected
                                        ? FontWeight.w400
                                        : FontWeight.bold,
                                    color: !_isCounterySelected
                                        ? Colors.grey
                                        : AppConstantsColor.darkTextColor,
                                  ),
                                ),
                                ),    
                          ],
                        ),
                      ),
                    ],
                  ),
                );
  }

  _productNameAndPrice() {
    return Row(
      children: [
        Text(
          widget.model.model,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
        Expanded(child: Container()),
        Text(
          "\$${widget.model.price.toStringAsFixed(2)}",
          style: AppThemes.detailsProductPrice,
        )
      ],
    );
  }

  Widget _morePicOfProduct(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            4,
            (index) => index == 3
                ? Container(
                    padding: const EdgeInsets.all(2),
                    width: size.width / 5,
                    height: size.height / 14,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: DecorationImage(
                          image: AssetImage(widget.model.imgAddress),
                          colorFilter: ColorFilter.mode(
                            Colors.grey.withOpacity(1),
                            BlendMode.darken,
                          )),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_fill_outlined,
                        color: AppConstantsColor.lightTextColor,
                        size: 25,
                      ),
                    ),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: roundedImage(size.width, size.height))),
      ),
    );
  }

  Widget _topProducteImgBg(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 60,
            bottom: 20,
            child: Container(
              width: size.width,
              height: size.height / 2.2,
              decoration: BoxDecoration(
                  color: widget.model.modelColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(1500),
                      bottomRight: Radius.circular(100))),
            ),
          ),
          Positioned(
            top: 90,
            left: 50,
            child: Hero(
              tag: widget.isComeFromSection
                  ? widget.model.model
                  : widget.model.imgAddress,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-25 / 360),
                child: SizedBox(
                  width: size.width / 1.3,
                  height: size.height / 4.3,
                  child: Image(image: AssetImage(widget.model.imgAddress)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  roundedImage(width, height) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(
        image: AssetImage(widget.model.imgAddress),
      ),
    );
  }

  Widget _productInfo(width, heigth) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: SizedBox(
        width: width,
        height: heigth / 9,
        child: Text(
          'Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,discovered the undoubtable source.',
          style: AppThemes.detailsProductDescriptions,
        ),
      ),
    );
  }

  Widget _moreDetailsText(width, heigth) {
    return const Padding(
      padding: EdgeInsets.only(top: 3),
      child: Text(
        'MORE DETAILS',
        style: AppThemes.detailsMoreText,
      ),
    );
  }
}
