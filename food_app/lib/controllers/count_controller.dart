import 'package:food_app/helper/snacks.dart';
import 'package:get/get.dart';

class CountController extends GetxController {
  String? tag = "null";
  RxInt count = RxInt(1);

  CountController({this.tag, int? value}) {
    if(value != null) count = RxInt(value);
  }

  void increment(){
      if(count.value == 24) {
        Snacks.showWarningSnackBar("Item Count", "You can't increase count more!");
        return;
      }
      count.value++;
      update();
  }

   void updateCount(int value){
     count.value += value;
     print("updated ${tag} count = ${count.value}");
   }
  void decrement(){
    if(count.value == 1)  return;
    count.value--;
    update();
  }
}