import 'package:food_app/models/products_model.dart';

class CartItemModel {
  ProductModel? product;
  bool? isAvailable;
  int? quantity;
  String? time;

  CartItemModel({
    this.product,
    this.isAvailable,
    this.quantity,
    this.time,
  });

  CartItemModel.fromJson(Map<String, dynamic> json) {
    product = ProductModel.fromJson(json["product"]);
    isAvailable = json['isExist'];
    quantity = json['quantity'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product!.toJson();
    data['isExist'] = this.isAvailable;
    data['quantity'] = this.quantity;
    data['time'] = this.time;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "id: " +  product!.id!.toString() + "\t" + "name: " + product!.name! + "\t" + quantity.toString() + "\n";
  }
}
