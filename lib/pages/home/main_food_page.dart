import 'package:ecommercewithfirebase/pages/home/food_page_body.dart';
import 'package:ecommercewithfirebase/utils/colors.dart';
import 'package:ecommercewithfirebase/utils/dimensions.dart';
import 'package:ecommercewithfirebase/widgets/bigText.dart';
import 'package:ecommercewithfirebase/widgets/smallText.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            child: Container(
              margin:EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15) ,
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Bigtext(text: "Bangladesh",color: AppColors.mainColor,),
                      Row(
                        children: [
                          Smalltext(text: "Dhaka",color: Colors.black54,),
                          Icon(Icons.arrow_drop_down)
                        ],
                      )
                  ],),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search,color:Colors.white,size:Dimensions.iconSize24) ,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: FoodPageBody(),
          ),
        ],
      ),
    );
  }
}
