import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;
  final double size;

  const AppIcon({Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xfffcf4e4),
    this.iconColor = Colors.white,
    this.iconSize = 18,
    this.size = 40
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize.v,
        ),
        width: size.h,
        height: size.v,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size/2),
            color: backgroundColor
        ),
    );
  }
}
