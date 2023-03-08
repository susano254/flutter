import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';

class MyInkWell extends StatelessWidget {
  Color splashColor;
  Widget child;
  Function onTap;

  MyInkWell({Key? key,
    required this.onTap,
    required this.child,
    this.splashColor = const Color(0xff89dad0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: splashColor,
        borderRadius: BorderRadius.circular(Dimensions.vertical(20)),
        onTap: (){
          this.onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: child,
        ),
      ),
    );
  }
}
