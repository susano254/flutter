import 'package:flutter/material.dart';
import 'package:food_app/controllers/count_controller.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/my_inkwell.dart';
import 'package:get/get.dart';

class ItemsCountWidget extends StatefulWidget {
  CountController controller;
  Color color;
  double textSize;
  double iconSize;
  Function? postIncrement;
  Function? postDecrement;

  ItemsCountWidget({Key? key,
    required this.controller,
    this.color = Colors.transparent,
    this.textSize = 24,
    this.iconSize = 24,
    this.postIncrement,
    this.postDecrement,
  }) : super(key: key);

  @override
  State<ItemsCountWidget> createState() => _ItemsCountWidgetState();
}

class _ItemsCountWidgetState extends State<ItemsCountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(Dimensions.vertical(20))
      ),
      child: Row(
        children: [
          MyInkWell(
            splashColor: Colors.grey,
            onTap: (){
              print("decrementing controller: ${widget.controller.tag}");
              widget.controller.decrement();
              if(widget.postDecrement != null) widget.postDecrement!();
            },
            child: Icon(Icons.remove, size: widget.iconSize,)
          ),
          SizedBox(width: Dimensions.horizontal(5),),
          BigText(text: widget.controller.count.toString(), size: widget.textSize,),
          SizedBox(width: Dimensions.horizontal(5),),
          MyInkWell(
            splashColor: Colors.grey,
            onTap: (){
              print("incrementing controller: ${widget.controller.tag}");
              widget.controller.increment();
              if(widget.postIncrement != null) widget.postIncrement!();
            },
            child: Icon(Icons.add, size: widget.iconSize,)
          ),
        ],
      ),
    );
  }
}
