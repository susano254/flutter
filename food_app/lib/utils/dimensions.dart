import 'package:flutter/material.dart';
import 'package:food_app/main.dart';

extension Dimensions on num{
  static BuildContext context = navigatorKey.currentContext!;
  static late double screenHeight;
  static late double screenWidth;
  static final double designHeight = 877.0;
  static final double designWidth = 412.0;

  double get v => vertical(this.toDouble());
  double get h => horizontal(this.toDouble());

  static double vertical(double dim){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    double val = (screenHeight * dim)/designHeight;
    return val;
  }
  static double horizontal(double dim){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    double val = (screenWidth * dim)/designWidth;
    return val;
  }
}