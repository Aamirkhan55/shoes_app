import 'package:flutter/material.dart';

class CustomSnackbar {
  CustomSnackbar._();
  static successSnackBar() => SnackBar(
    backgroundColor: Colors.green[400],
    content: const Text("Successfully Added Your Bag"),
    action: SnackBarAction(
      textColor: Colors.white,
      label: "Got It", 
      onPressed: () {},
      ),
    );

   static faildSnackBar() => SnackBar(
    backgroundColor: Colors.red[400],
    content: const Text("You Have Added This Item Before"),
    action: SnackBarAction(
      textColor: Colors.white,
      label: "Got It", 
      onPressed: () {},
      ),
    );  
}