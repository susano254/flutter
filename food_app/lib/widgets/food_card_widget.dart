import 'package:flutter/material.dart';
import 'package:food_app/models/products_model.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/icon_text_widget.dart';
import 'package:food_app/widgets/small_text.dart';

class FoodCardWidget extends StatelessWidget {
  final double size;
  final ProductModel product;

  const FoodCardWidget({Key? key,
    required this.product,
    this.size = 20
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText( text: product.name!, size: size,),
          SizedBox(height: Dimensions.vertical(10),),
          Row(
            children: [
              Wrap(
                  children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size: Dimensions.vertical(28),))
              ),
              SizedBox(width: Dimensions.horizontal(5),),
              SmallText(text: "4.5",),
              SizedBox(width: Dimensions.horizontal(7),),
              SmallText(text: "1287",),
              SizedBox(width: Dimensions.horizontal(3),),
              SmallText(text: "comments"),

            ],
          ),
          SizedBox(height: Dimensions.vertical(20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconTextWidget(
                  icon: Icons.circle_sharp,
                  text: "Normal",
                  iconColor: AppColors.iconColor1
              ),
              IconTextWidget(
                  icon: Icons.location_on,
                  text: "1.7Km",
                  iconColor: AppColors.mainColor
              ),
              IconTextWidget(
                  icon: Icons.access_time,
                  text: "32min",
                  iconColor: AppColors.iconColor2
              ),

            ],
          )
        ],
      ),
    );
  }
}
