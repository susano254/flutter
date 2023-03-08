import 'package:flutter/material.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/count_controller.dart';
import 'package:food_app/helper/snacks.dart';
import 'package:food_app/models/products_model.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/app_constants.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/add_to_cart_widget.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/cart_widget.dart';
import 'package:food_app/widgets/expandable_text_widget.dart';
import 'package:food_app/widgets/like_widget.dart';
import 'package:food_app/widgets/my_inkwell.dart';
import 'package:get/get.dart';

class RecommendedFoodDetails extends StatefulWidget {
  RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  State<RecommendedFoodDetails> createState() => _RecommendedFoodDetailsState();
}

class _RecommendedFoodDetailsState extends State<RecommendedFoodDetails> {
  ProductModel product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.vertical(70),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyInkWell(
                  splashColor: AppColors.appIconColor,
                  child: AppIcon(
                    icon: Icons.clear,
                    iconColor: Colors.black,
                  ),
                  onTap: (){
                    Get.back();
                  },
                ),
                GetBuilder<CartController>(
                    builder: (controller) {
                      return MyInkWell(
                          splashColor: AppColors.appIconColor,
                          onTap: () {
                            Get.toNamed(RouteHelper.cartPage);
                          },
                          child: CartWidget(controller: controller,)

                      );
                    }
                )

        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: Container(
          padding: EdgeInsets.all(Dimensions.vertical(6)),
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.vertical(20)),
                    topRight: Radius.circular(Dimensions.vertical(20))
                  )
                ),
                child: Center(
                  child: BigText(
                    text: product.name!,
                    size: Dimensions.vertical(26),
                  ),
                ),
              ),
            ),
            expandedHeight: 250,
            backgroundColor: AppColors.mainColor,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: NetworkImage(
                  AppConstants.BASE_URL + AppConstants.UPLOADS + product.img!,
                ),
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(Dimensions.vertical(10)),
              child: ExpandableTextWidget(
                text: product.description!
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<CountController>(
        init: CountController(),
        builder: (countController) => Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   MyInkWell(
                     splashColor: AppColors.mainColor,
                     onTap: (){
                       countController.decrement();
                     },
                     child: AppIcon(
                       icon: Icons.remove,
                       backgroundColor: AppColors.mainColor,
                       iconSize: Dimensions.vertical(20),
                       size: 38,
                     ),
                   ),
                  BigText(
                    text: "\$" + (product.price! * countController.count.value).toString() + "  X " + countController.count.value.toString(),
                    color: AppColors.mainBlackColor,
                    size: Dimensions.vertical(26),
                  ),
                  MyInkWell(
                    splashColor: AppColors.mainColor,
                    onTap: (){
                      countController.increment();
                    },
                    child: AppIcon(
                      icon: Icons.add,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.vertical(20),
                      size: 38,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.vertical(20)), topLeft: Radius.circular(Dimensions.vertical(20)))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyInkWell(
                      onTap: (){
                        setState(() {
                          product.isLiked = !product.isLiked;
                        });
                      },
                      child: LikeWidget(isLiked: product.isLiked,),
                      splashColor: Colors.white,
                    ),
                    MyInkWell(
                      splashColor: AppColors.mainColor,
                      onTap: (){
                        //only put the controller for the in-cart items this way
                        Get.put(CountController(tag: product.id.toString() + " " + product.name!, value: countController.count.value), tag: product.name, permanent: true);
                        //get the cart controller of the user and update with the new items
                        Get.find<CartController>().updateCart(product, countController.count.value);
                        //finally show feed back to user
                        Snacks.showNormalSnackBar("Cart", "${countController.count.value} ${product .name} added ");
                      },
                      child: AddToCartWidget(cost: product.price!.toDouble(), count: countController.count.value,)
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
