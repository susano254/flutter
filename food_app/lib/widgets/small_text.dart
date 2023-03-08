import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double height;

  SmallText({Key? key,
    this.color = const Color(0xffccc7c5),
    required this.text,
    this.size = 12,
    this.height = 1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: Dimensions.vertical(size),
          fontFamily: 'Roboto',
          height: height
      ),
    );
  }
}
