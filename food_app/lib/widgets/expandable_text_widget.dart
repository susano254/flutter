import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/my_inkwell.dart';
import 'package:food_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  double textHeight = Dimensions.vertical(1.8);
  late double maxChars;

  late String firstHalf;
  late String secondHalf;
  late bool hidden;

  @override
  void initState() {
    super.initState();
    //some factor from the text height
    maxChars = textHeight*100;
    if(widget.text.length < maxChars){
      firstHalf = widget.text;
      secondHalf = "";
      hidden = false;
    }
    else {
      firstHalf = widget.text.substring(0, maxChars.floor());
      secondHalf = widget.text.substring(maxChars.floor()+1, widget.text.length);
      hidden = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: renderExpandableTextWidget(),
      ),
    );
  }

  List<Widget> renderExpandableTextWidget() {
      late List<Widget> expTextWidgetList;
      if(hidden && secondHalf.isNotEmpty){
        expTextWidgetList = <Widget>[
          SmallText(text: firstHalf + "...", color: AppColors.paraColor, height: textHeight),
          SizedBox(height: Dimensions.vertical(10),),
          MyInkWell(
            onTap: (){
              setState(() {
                hidden = !hidden;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmallText(text: "Show More", color: AppColors.mainColor,),
                Icon(Icons.arrow_drop_down, color: AppColors.mainColor,)
              ],
            ),
          )
        ];
      }
      else if(!hidden && secondHalf.isNotEmpty){
        expTextWidgetList = <Widget>[
          SmallText(text: widget.text, color: AppColors.paraColor, height: textHeight),
          SizedBox(height: Dimensions.vertical(10),),
          MyInkWell(
            onTap: (){
              setState(() {
                hidden = !hidden;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmallText(text: "Show Less", color: AppColors.mainColor,),
                Icon(Icons.arrow_drop_up, color: AppColors.mainColor,)
              ],
            ),
          )
        ];
      }
      else {
        expTextWidgetList = <Widget>[
          SmallText(text: widget.text, color: AppColors.paraColor, height: textHeight)
        ];
      }

      return expTextWidgetList;
  }
}
