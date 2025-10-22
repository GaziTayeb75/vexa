import 'package:ecommercewithfirebase/utils/colors.dart';
import 'package:ecommercewithfirebase/utils/dimensions.dart';
import 'package:ecommercewithfirebase/widgets/app_icon.dart';
import 'package:ecommercewithfirebase/widgets/bigText.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: false,
            snap: false,
            // toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                    child:
                        Bigtext(size: Dimensions.font26, text: "Chinese Side")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20))),
              ),
            ),
            //pinned: true,
            backgroundColor: AppColors.yellowColor,
            // expandedHeight: 300,
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
                    // margin:EdgeInsets.only(),
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
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20)),
                Container(
                  height: 1000,
                  color: Colors.transparent,
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                Bigtext(
                  text: "\$12.88 " + " X " + " 0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add)
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height10,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Icon(Icons.favorite,color: AppColors.mainColor,)
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height10,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  child: Bigtext(
                    text: "\$ 28 | Add to card",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
