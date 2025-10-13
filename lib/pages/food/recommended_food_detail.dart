import 'package:ecommercewithfirebase/utils/colors.dart';
import 'package:ecommercewithfirebase/utils/dimensions.dart';
import 'package:ecommercewithfirebase/widgets/app_icon.dart';
import 'package:ecommercewithfirebase/widgets/bigText.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom:PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(

                    child: Center(child:Bigtext(size:Dimensions.font26, text: "Chinese Side")),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5,bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(topRight:Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20) )
                  ),
                ),) ,
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
                children: [
                  Container(
                    margin:EdgeInsets.only(),
                    child: Text(
                      "A Flavorful Symphony of Spices and RiceBiriyani, "
                          "often referred to as the king of dishes, "
                          "is a world-renowned, aromatic, "
                          "and flavorful delicacy made primarily of basmati rice, "
                          "fragrant spices, and succulent meat, fish, "
                          "eggs, or vegetables. Originating in the Indian subcontinent, "
                          "it has traveled across cultures, "
                          "evolving into countless regional varieties while retaining "
                          "its soul-stirring essence Biriyani transcends "
                          "borders and is adored worldwide for its rich "
                          "flavors and comforting aroma. It’s a staple at "
                          "weddings, festivals, and celebratory occasions.l Symphony of Spices and RiceBiriyani, "
                          "often referred to as the king of dishes, "
                          "is a world-renowned, aromatic, "
                          "and flavorful delicacy made primarily of basmati rice, "
                          "fragrant spices, and succulent meat, fish, "
                          "eggs, or vegetables. Originating in the Indian subcontinent, "
                          "it has traveled across cultures, "
                          "evolving into countless regional varieties while retaining "
                          "its soul-stirring essence Biriyani transcends "
                          "borders and is adored worldwide for its rich "
                          "flavors and comforting aroma. It’s a staple at "
                          "weddings, festivals, and celebratory occasions.",

                    ),
                  ),
                ],
              ),
            ),

        ],
      ),
    );
  }
}
