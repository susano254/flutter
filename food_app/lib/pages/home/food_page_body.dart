import 'package:flutter/material.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:food_app/controllers/recommended_product_controller.dart';
import 'package:food_app/models/products_model.dart';
import 'package:food_app/pages/food/popular_food_details.dart';
import 'package:food_app/pages/food/recommended_food_details.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/app_constants.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/food_card_widget.dart';
import 'package:food_app/widgets/icon_text_widget.dart';
import 'package:food_app/widgets/my_inkwell.dart';
import 'package:food_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  double currPageValue = 0.0;
  double scaleFactor = 0.8;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded ? Container(
              height: Dimensions.vertical(320),
              child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position){
                  return _buildPageItem(position, popularProducts.popularProductList[position]);
                }
              ),
            ) : CircularProgressIndicator(color: AppColors.mainColor,);
        }),
        // dots for the slider
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return SmoothPageIndicator(
            controller: pageController,
            count: popularProducts.popularProductList.length,
            effect: WormEffect(
              activeDotColor: AppColors.mainColor,
            )

            );
        }),
        //popular Text
        SizedBox(height: Dimensions.vertical(30),),
        Container(
          margin: EdgeInsets.only(left: Dimensions.horizontal(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.horizontal(10),),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.vertical(3)),
                child: BigText(text: ".", color: AppColors.textColor,),
              ),
              SizedBox(width: Dimensions.horizontal(10),),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.vertical(2)),
                child: SmallText(text: "Food Pairing"),
              )
            ],
          ),
        ),
        //list of food images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded ? ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedProduct.recommendedProductList.length,
            itemBuilder: (context, index) => MyInkWell(
              child: cardFood(index, recommendedProduct.recommendedProductList[index]),
              onTap: (){
                Get.toNamed(RouteHelper.recommendedFoodRoute, arguments: recommendedProduct.recommendedProductList[index]);
              },
            ),
          ) : CircularProgressIndicator(color: AppColors.mainColor,);
        }),
    ]
    );
  }

  Widget _buildPageItem(int index, ProductModel product) {
    double currScale = 0.8;

    if(index == currPageValue.floor()){
      //we want to scale each card according to it's offset from the current displayed card
      //so if the current card is moving left current pages increases fractionally from index to index+1
      //we need to use this difference to somehow scale the image till it reaches 80% of its size
      //when this number is 0 we need a solid 1 for the scale that why the 1 - () in front
      //and when this number is a 1 we need 80% so 1 - 0.2 gives 80
      //in other words 1 - (1 - 0.8) and 0.8 is the scaleFactor
      //so wrapping up current scale in below equation
      currScale = 1 - (currPageValue - index)*(1 - scaleFactor);
    }
    else if (index == currPageValue.floor()+1){
      currScale = scaleFactor + ((currPageValue+1) - index) * (1 - scaleFactor);
    }
    else if (index == currPageValue.floor()-1){
      currScale = 1 - (currPageValue - index)*(1 - scaleFactor);
    }
    //matrix = Matrix4.diagonal3Values(0, currScale, 0);

    return Transform.scale(
      scaleY: currScale,
      child: MyInkWell(
        onTap: (){
          Get.toNamed(RouteHelper.popularFoodRoute, arguments: product);
        },
        child: Stack(
          children: [
            Container(
              height: Dimensions.vertical(220),
              width: Dimensions.horizontal(400),
              margin: EdgeInsets.only(left: Dimensions.horizontal(10), right: Dimensions.horizontal(10)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                   image: DecorationImage(
                       fit: BoxFit.cover,
                       image: NetworkImage(
                         AppConstants.BASE_URL + AppConstants.UPLOADS + product.img!,
                       )
                   )
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.vertical(140),
                width: Dimensions.horizontal(300),
                margin: EdgeInsets.only(bottom: Dimensions.vertical(15)),
                padding: EdgeInsets.all(Dimensions.vertical(15)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.vertical(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0)
                    ),
                  ],
                ),
                child: FoodCardWidget( product: product,),

              ),
            ),
          ]
        ),
      ),
    );
  }

  Widget cardFood(int index, ProductModel product) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.horizontal(20), right: Dimensions.horizontal(20), bottom: Dimensions.vertical(5)),
      child: Row(
        children: [
          Container(
            height: Dimensions.vertical(120),
            width: Dimensions.horizontal(120),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.vertical(20)),
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage( AppConstants.BASE_URL + AppConstants.UPLOADS + product.img!)
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(Dimensions.vertical(10)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.vertical(10)),
                  bottomRight: Radius.circular(Dimensions.vertical(10)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: product.name!),
                  SizedBox(height: Dimensions.vertical(10),),
                  SmallText(text: "With 4 Sauces"),
                  SizedBox(height: Dimensions.vertical(10),),
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
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

}

