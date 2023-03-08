import 'package:food_app/controllers/count_controller.dart';
import 'package:food_app/data/repository/cart_repo.dart';
import 'package:food_app/models/cart_item_model.dart';
import 'package:food_app/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartRepo cartRepo;
  double totalCost = 0.0;

  CartController({required this.cartRepo});

  void init(){
    //load prev user data
  }

  bool isEmpty(){
    return cartRepo.isEmpty();
  }


  void updateCart(ProductModel product, int quantity){
    CartItemModel item = CartItemModel();

    item.product = product;
    item.quantity = quantity;
    item.isAvailable = true;
    item.time = DateTime.now().toString();

    if(cartRepo.items.containsKey(item.product!.id)){
      print("item already exists");
      //update the repo
      cartRepo.updateItem(item.product!.id!, item);
      //update the count controller
      Get.find<CountController>(tag: product.name).updateCount(quantity);
    }
    else {
      cartRepo.addItem(item);
    }

    update();
  }

  void updateItemQuantity(int id, int quantity){
    CartItemModel item = cartRepo.items[id]!;
    int oldQuantity = item.quantity!;
    cartRepo.items.update(id, (value) {
      value.quantity = quantity;
      return value;
    });
    oldQuantity < quantity ? (totalCost += item.product!.price!) : (totalCost -= item.product!.price!);
    print(cartRepo.items);
    update();
  }

  List<CartItemModel> getItems(){
    return cartRepo.findAll();
  }

  void deleteItem(int id){
    cartRepo.deleteItem(id);
    print(cartRepo.items);
    update();
  }
}