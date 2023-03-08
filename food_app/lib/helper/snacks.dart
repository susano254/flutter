import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:get/get.dart';

class Snacks {

  static void showNormalSnackBar(String title, String text){
    Get.closeAllSnackbars();
    Get.snackbar(title, text, colorText: Colors.white, backgroundColor: AppColors.mainColor);
  }
  static showWarningSnackBar(String title, String text){
    Get.closeAllSnackbars();
    Get.snackbar(title, text, colorText: Colors.white, backgroundColor: Colors.red);
  }

  static void showColoredSnackBar(String title, String text, Color color, Color textColor){
    Get.closeAllSnackbars();
    Get.snackbar(title, text, colorText: textColor, backgroundColor: color);
  }

}