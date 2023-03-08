import 'package:flutter/material.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/count_controller.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:food_app/controllers/recommended_product_controller.dart';
import 'package:food_app/helper/snacks.dart';
import 'package:food_app/models/cart_item_model.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/app_constants.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/items_count_widget.dart';
import 'package:food_app/widgets/my_inkwell.dart';
import 'package:food_app/widgets/small_text.dart';
import 'package:get/get.dart';

class WishCart extends StatelessWidget {
  const WishCart({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        builder: (cartController){
          //get the items for faster access
          List<CartItemModel> items = cartController.getItems();
          //init the total cost variable
          cartController.totalCost = 0;
          items.forEach((element) {cartController.totalCost += (element.quantity! * element.product!.price!);});
          //build the GUI
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.horizontal(8), right: Dimensions.horizontal(8), top: Dimensions.horizontal(8) ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyInkWell(
                          splashColor: AppColors.mainColor,
                          onTap: (){
                            Get.back();
                          },
                          child: AppIcon(icon: Icons.arrow_back_ios, iconColor: Colors.black, backgroundColor: Colors.transparent),
                        ),
                        MyInkWell(
                          splashColor: AppColors.mainColor,
                          onTap: (){
                            Get.toNamed(RouteHelper.initialRoute);
                          },
                          child: AppIcon(icon: Icons.home, iconColor: Colors.black, backgroundColor: Colors.transparent),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartController.getItems().length,
                      itemBuilder: (context, index) {
                        CartItemModel item = items[index];
                        return GetBuilder<CountController>(
                            tag: item.product!.name,
                            builder: (countController) {
                              return Container(
                                child: MyInkWell(
                                  onTap: () {
                                    if(Get.find<PopularProductController>().popularProductList.contains(item.product))
                                      Get.toNamed(RouteHelper.popularFoodRoute, arguments: item.product);
                                    else if(Get.find<RecommendedProductController>().recommendedProductList.contains(item.product))
                                      Get.toNamed(RouteHelper.recommendedFoodRoute, arguments: item.product);
                                    else
                                      Snacks.showWarningSnackBar("Cart", "Couldn't find given item in any list");
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: Dimensions.vertical(140),
                                        width: Dimensions.horizontal(140),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular( Dimensions.vertical(20)),
                                          color: Colors.white,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage( AppConstants.BASE_URL + AppConstants.UPLOADS + item.product!.img!)
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Container(
                                        height: Dimensions.vertical(120),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(
                                                  Dimensions.vertical(20)),
                                              bottomRight: Radius.circular(
                                                  Dimensions.vertical(20))),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                BigText(
                                                    text: (item.product!.name!.length > 16) ? (item.product!.name!.substring( 0, 15) + "...") : item.product!.name!,
                                                    size: Dimensions.horizontal(18)
                                                ),
                                                MyInkWell(
                                                    splashColor: Colors.red,
                                                    onTap: () {
                                                      cartController.deleteItem(item.product!.id!);
                                                      Snacks.showWarningSnackBar("Cart", "${item.product!.name} deleted from cart");
                                                      Get.delete<CountController>(tag: item.product!.name, force: true);
                                                    },
                                                    child: AppIcon(
                                                      icon: Icons.delete_forever,
                                                      iconColor: Colors.red,
                                                      backgroundColor: Colors .transparent,
                                                      size: 22,
                                                      iconSize: 20,
                                                    )
                                                )
                                              ],
                                            ),
                                            SizedBox( height: Dimensions.vertical(5),),
                                            SmallText(text: "Spicy",),
                                            SizedBox( height: Dimensions.vertical(8),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                BigText( text: "\$${countController.count.value * item.product!.price!}", size: Dimensions.vertical(20), color: Colors.red,),
                                                ItemsCountWidget(controller: countController, color: Colors.transparent, textSize: Dimensions.vertical(22), iconSize: Dimensions.vertical( 20),
                                                  postDecrement: () => cartController.updateItemQuantity(item.product!.id!, countController.count.value),
                                                  postIncrement: () => cartController.updateItemQuantity(item.product!.id!, countController.count.value),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              );
                            }
                        );

                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
