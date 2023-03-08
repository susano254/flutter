import 'package:food_app/pages/cart/cart.dart';
import 'package:food_app/pages/food/popular_food_details.dart';
import 'package:food_app/pages/food/recommended_food_details.dart';
import 'package:food_app/pages/home/home_page.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import 'package:food_app/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static String splash_screen = "/splash";
  static String initialRoute = "/";
  static String popularFoodRoute = "/popular-food-details";
  static String recommendedFoodRoute = "/recommended-food-details";
  static String cartPage = "/cart";

  static List<GetPage> routes = [
    GetPage(name: splash_screen, page: () => SplashScreen()),
    GetPage(name: initialRoute, page: () => HomePage()),
    GetPage(name: popularFoodRoute, page: () => PopularFoodDetails()),
    GetPage(name: recommendedFoodRoute, page: () => RecommendedFoodDetails()),
    GetPage(name: cartPage, page: () => CartPage()),
  ];
}