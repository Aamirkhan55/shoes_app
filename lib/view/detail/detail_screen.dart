import 'package:flutter/material.dart';
import 'package:shoes_app/model/shoe_model.dart';
import 'package:shoes_app/theme/custom_app_theme.dart';
import 'package:shoes_app/utils/constants.dart';
import 'package:shoes_app/view/detail/components/appbar.dart';

class DetailScreen extends StatelessWidget {
  final ShoeModel model;
  final bool isComeFromSection;
  const DetailScreen(
      {super.key, required this.model, required this.isComeFromSection});

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
                children: [
                  _productNameAndPrice(),
                  _productInfo(size.width, size.height),
                  _moreDetailsText(size.width, size.height),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  _productNameAndPrice() {
    return Row(
      children: [
        Text(
          model.model,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
        Expanded(child: Container()),
        Text(
          "\$${model.price.toStringAsFixed(2)}",
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
                          image: AssetImage(model.imgAddress),
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
                  color: model.modelColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(1500),
                      bottomRight: Radius.circular(100))),
            ),
          ),
          Positioned(
            top: 90,
            left: 50,
            child: Hero(
              tag: isComeFromSection ? model.model : model.imgAddress,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-25 / 360),
                child: SizedBox(
                  width: size.width / 1.3,
                  height: size.height / 4.3,
                  child: Image(image: AssetImage(model.imgAddress)),
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
        image: AssetImage(model.imgAddress),
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
  return Container(
    height: heigth / 26,
    padding: const EdgeInsets.only(right: 280),
    child: const FittedBox(
      child: Text(
        'MORE DETAILS',
        style: AppThemes.detailsMoreText,
        ),
    ),
  );
 }
}
