import 'package:flutter/material.dart';
import 'package:shoes_app/data/dummy_data.dart';
import 'package:shoes_app/model/shoe_model.dart';
import 'package:shoes_app/utils/components/custom_snackbar.dart';

class AppMethods {
  AppMethods._();
  static void addToCart(ShoeModel data, BuildContext context) {
    bool contains = itemsOnBag.contains(data);

    if (contains == true) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar.faildSnackBar());
    } else {
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar.successSnackBar());
    }
  }

  static double sumOfItemsOnBag() {
    double sumPrice = 0.0;
    for (ShoeModel bagModel in itemsOnBag) {
      sumPrice = sumPrice + bagModel.price;
    }
    return sumPrice;
  }
}
