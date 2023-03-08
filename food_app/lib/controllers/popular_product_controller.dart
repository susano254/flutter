import 'package:food_app/data/repository/popular_product_repo.dart';
import 'package:food_app/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;                  //dart getter

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;



  PopularProductController({required this.popularProductRepo});

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      _isLoaded = true;
      //print(response.body);
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      update();
    }
    else {
      print("getting products failed ${response.statusCode}");
      print(response.body);
    }
  }
}