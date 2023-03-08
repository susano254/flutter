import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/count_controller.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:food_app/controllers/recommended_product_controller.dart';
import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/data/repository/cart_repo.dart';
import 'package:food_app/data/repository/popular_product_repo.dart';
import 'package:food_app/data/repository/recommended_product_repo.dart';
import 'package:food_app/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //Clients
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //Repos
  Get.put(PopularProductRepo(apiClient: Get.find()), permanent: true);
  Get.put(RecommendedProductRepo(apiClient: Get.find()), permanent: true);
  Get.put(CartRepo(apiClient: Get.find()), permanent: true);

  //Controllers
  Get.put(PopularProductController(popularProductRepo: Get.find()), permanent: true);
  Get.put(RecommendedProductController(recommendedProductRepo: Get.find()), permanent: true);
  Get.put(CartController(cartRepo: Get.find()), permanent: true);
}