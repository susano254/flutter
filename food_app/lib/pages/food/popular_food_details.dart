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
import 'package:food_app/widgets/food_card_widget.dart';
import 'package:food_app/widgets/items_count_widget.dart';
import 'package:food_app/widgets/my_inkwell.dart';
import 'package:get/get.dart';

class PopularFoodDetails extends StatelessWidget {
  ProductModel product = Get.arguments;
  PopularFoodDetails({Key? key}) : super(key: key){
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 320,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage( AppConstants.BASE_URL + AppConstants.UPLOADS + product.img!, )
                )
              ),
            ),
          ),
          // icons
          Positioned(
            left: 20,
            right: 20,
            top: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyInkWell(
                  splashColor: AppColors.appIconColor,
                  onTap: (){
                    Get.back();
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios, iconColor: Colors.black,),
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
          )
          ),
          // food details
          Positioned(
            left: 0,
            right: 0,
            top: 300,
            child: Container(
              padding: EdgeInsets.all(Dimensions.vertical(15)),
              width: double.maxFinite,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),

              child: Container(
                padding: EdgeInsets.only(top: Dimensions.vertical(10), bottom: Dimensions.vertical(80)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodCardWidget(product: product, size: 30,),
                    SizedBox(height: Dimensions.vertical(15)),
                    BigText(text: "Introduce"),
                    SizedBox(height: Dimensions.vertical(10)),
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: product.description!)))
                  ],
                ),
              ),
          ))
        ],
      ),
      bottomNavigationBar: GetBuilder<CountController>(
        init: CountController(),
        builder: (countController) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.vertical(20)),
                    topLeft: Radius.circular(Dimensions.vertical(20)))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.all(Dimensions.vertical(10)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.vertical(20)))
                    ),
                    child: ItemsCountWidget(controller: countController,)
                ),
                MyInkWell(
                    splashColor: AppColors.mainColor,
                    onTap: () {
                      //only put the controller for the in-cart items this way
                      Get.put(CountController(tag: product.id.toString() + " " + product.name!, value: countController.count.value), tag: product.name, permanent: true);
                      //get the cart controller of the user and update with the new items
                      Get.find<CartController>().updateCart(product, countController.count.value);
                      Snacks.showNormalSnackBar("Cart", "${countController.count.value} ${product .name} added ");
                    },
                    child: AddToCartWidget(cost: product.price!.toDouble(), count: countController.count.value)
                )
              ],
            ),
          );
        }
      ),
    );
  }

}
