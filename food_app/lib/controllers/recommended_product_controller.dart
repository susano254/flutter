import 'package:food_app/data/repository/popular_product_repo.dart';
import 'package:food_app/data/repository/recommended_product_repo.dart';
import 'package:food_app/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;                  //dart getter

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;



  RecommendedProductController({required this.recommendedProductRepo});

  Future<void> getRecommendedProductList() async {
    print("recommended Repo called");
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode == 200){
      _isLoaded = true;
      //print(response.body);
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      print(_recommendedProductList);
      update();
    }
    else {
      print("getting products failed ${response.statusCode}");
      print(response.body);
    }
  }
}
