import 'package:ecommercewithfirebase/utils/colors.dart';
import 'package:ecommercewithfirebase/utils/dimensions.dart';
import 'package:ecommercewithfirebase/widgets/smallText.dart';
import 'package:flutter/material.dart';

class ExandableTextWidget extends StatefulWidget {
  final String text;
  const ExandableTextWidget({super.key, required this.text});

  @override
  State<ExandableTextWidget> createState() => _ExandableTextWidgetState();
}

class _ExandableTextWidgetState extends State<ExandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

bool hiddenText=true;

double textHeight = Dimensions.screenHeight/5.63;

@override
 initState(){
  super.initState();
  if(widget.text.length>textHeight){
    firstHalf = widget.text.substring(0,textHeight.toInt());
    secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
  }else{
    firstHalf=widget.text;
    secondHalf="";
  }
}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?Smalltext(color:AppColors.paraColor ,size:Dimensions.font16,text: firstHalf):Column(
        children: [
          Smalltext(height:1.8  ,color:AppColors.paraColor ,text:hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
             setState(() {
               hiddenText=!hiddenText;
             });
             },
            child:Row(
              children: [
                Smalltext(size:Dimensions.font16,text: "Show more",color: AppColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColors.mainColor,),
              ],
            ) ,
          )
        ],
      ),
    );
  }
}
