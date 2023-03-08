import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/models/cart_item_model.dart';
import 'package:get/get.dart';

class CartRepo extends GetxService {
  final ApiClient apiClient;
  Map<int, CartItemModel> _items = Map();
  Map<int, CartItemModel> get items => _items;

  CartRepo({required this.apiClient});

  void addItem(CartItemModel item){
    _items[item.product!.id!] = item;
  }

  bool isEmpty(){
    return items.isEmpty;
  }

  List<CartItemModel> findAll(){
    return items.values.toList();
  }

  CartItemModel? getItem(int id){
    if(_items.containsKey(id))
      return _items[id]!;
    else
      return null;
  }

  void updateItem(int id, CartItemModel item){
    _items.update(item.product!.id!, (value){
      value.quantity = value.quantity! + item.quantity!;
      return value;
    });
  }

  void deleteItem(int id){
    _items.remove(id);
  }
}