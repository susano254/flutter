import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';

class LikeWidget extends StatelessWidget {
  bool isLiked;

  LikeWidget({Key? key,
    required this.isLiked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon;
    isLiked ? (icon = Icons.favorite) : (icon = Icons.favorite_border_outlined);
    return Container(
      padding: EdgeInsets.all(Dimensions.vertical(15)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.vertical(20))
      ),
      child: Icon(icon, color: AppColors.mainColor,)
    );
  }
}
