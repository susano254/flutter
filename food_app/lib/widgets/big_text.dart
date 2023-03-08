import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  TextOverflow overflow;

  BigText({Key? key,
    this.color = const Color(0xff332d2b),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 24
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: Dimensions.vertical(size),
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto'
      ),
    );
  }
}
