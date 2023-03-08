import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:food_app/controllers/recommended_product_controller.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    _loadResources();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    controller.forward();

   Timer(Duration(seconds: 4), () => Get.offNamed(RouteHelper.initialRoute) );
  }

  void _loadResources() {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<CartController>().init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  image: DecorationImage( image: AssetImage("assets/images/Me.jpg"), )
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          BigText(text: "Mahmoud Salah"),
        ],
      ),
    );
  }
}
