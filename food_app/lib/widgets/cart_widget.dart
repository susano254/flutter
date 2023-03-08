import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/app_icon.dart';

class CartWidget extends StatelessWidget {
  CartController controller;
  Color? backgroundColor; //= Colors.transparent;
  Color? iconColor; //= Colors.black;
  final double size;
  final double iconSize;
  final double hoverSize;
  CartWidget({
    Key? key,
    required this.controller,
    this.backgroundColor,
    this.iconColor = Colors.black,
    this.iconSize = 16,
    this.size = 40,
    this.hoverSize = 20
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Container(
        width: size+10,
        height: size,
        child: Stack(
            children: [
                Align(
                  alignment: Alignment.center,
                  child: AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: iconColor!,
                    backgroundColor: backgroundColor != null ? backgroundColor! : AppColors.appIconColor,
                    iconSize: iconSize,
                    size: size,
                  ),
                ),
                controller.isEmpty() ? Container() :
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: hoverSize,
                    height: hoverSize,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.mainColor
                    ),
                    child: Center(
                      child: Text(
                        controller.getItems().length.toString(),
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )
              ]
          ),
      ),
    );
  }
}
