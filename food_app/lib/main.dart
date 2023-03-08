import 'package:flutter/material.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:food_app/controllers/recommended_product_controller.dart';
import 'package:food_app/pages/cart/cart.dart';
import 'package:food_app/helper/dependencies.dart' as dep;
import 'package:food_app/pages/home/home_page.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import 'package:food_app/pages/splash/splash_page.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:get/get.dart';

import 'routes/route_helper.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Food App',
      //home: SplashScreen(),
      initialRoute: RouteHelper.splash_screen,
      getPages: RouteHelper.routes,
      defaultTransition: Transition.circularReveal,
    );
  }
}
