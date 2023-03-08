import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';

class AddToCartWidget extends StatefulWidget {
  final double cost;
  final int count;
  const AddToCartWidget({Key? key,
    required this.cost,
    required this.count,
  }) : super(key: key);

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  @override
  Widget build(BuildContext context) {
    double totalCost = widget.count * widget.cost;
    double size = 21;

    return Container(
      padding: EdgeInsets.all(Dimensions.vertical(15)),
      decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(Dimensions.vertical(20))
      ),
      child: Row(
        children: [
          BigText(
            text: "\$" + totalCost.toString(),
            color: Colors.white,
            size: size,
          ),
          SizedBox(width: Dimensions.horizontal(6),),
          BigText(text:"| Add To Cart", color: Colors.white, size: size,),
        ],
      ),
    );
  }
}
