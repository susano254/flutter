import 'package:flutter/material.dart';
import 'package:food_app/pages/home/food_page_body.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/my_inkwell.dart';
import 'package:food_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

//main home page
class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //first row in the home page for location ( country , city )
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.vertical(45), bottom: Dimensions.vertical(15)),
              padding: EdgeInsets.only(left: Dimensions.horizontal(20), right: Dimensions.horizontal(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Egypt",
                        color: AppColors.mainColor ,
                      ),
                      SizedBox(height: Dimensions.vertical(3)),
                      MyInkWell(
                        onTap: (){},
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: Dimensions.horizontal(10)),
                              child: SmallText(
                                text: 'Cairo',
                                color: AppColors.mainBlackColor,
                                size: Dimensions.vertical(16),
                              ),
                            ),
                            Icon(Icons.arrow_drop_down)
                          ]
                        ),
                      )
                    ],
                  ),
                  MyInkWell(
                    onTap: (){},
                    child: Container(
                      width: Dimensions.horizontal(45),
                      height: Dimensions.vertical(45),
                      child: Center(
                        child: Icon(
                            Icons.search,
                            color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: FoodPageBody()))
        ]
      ),
    );
  }
}
