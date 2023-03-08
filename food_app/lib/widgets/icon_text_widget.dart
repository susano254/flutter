import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/small_text.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconTextWidget({Key? key,
    required this.icon,
    required this.text,
    required this.iconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.vertical(25),),
        SizedBox(width: Dimensions.horizontal(5),),
        SmallText(text: text)
      ],
    );
  }
}
