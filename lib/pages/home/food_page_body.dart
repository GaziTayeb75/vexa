import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommercewithfirebase/utils/colors.dart';
import 'package:ecommercewithfirebase/utils/dimensions.dart';
import 'package:ecommercewithfirebase/widgets/app_column.dart';
import 'package:ecommercewithfirebase/widgets/bigText.dart';
import 'package:ecommercewithfirebase/widgets/icon_and_text_widget.dart';
import 'package:ecommercewithfirebase/widgets/smallText.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controllers/popular_product_controller.dart';
import '../../models/products_model.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  // এখানে Column-এর পরিবর্তে SingleChildScrollView ব্যবহার করুন
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            //slider section
            GetBuilder<PopularProductController>(builder: (popularProducts) {
              if (!popularProducts.isLoaded || popularProducts.popularProductList.isEmpty) {
                return Container(
                  height: Dimensions.pageView,
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.mainColor),
                  ),
                );
              }

              return Container(
                height: Dimensions.pageView,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProducts.popularProductList.length,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position, popularProducts.popularProductList[position]);
                  },
                ),
              );
            }),

            //dots
            GetBuilder<PopularProductController>(builder: (popularProducts) {
              if (!popularProducts.isLoaded || popularProducts.popularProductList.isEmpty) {
                return SizedBox(height: Dimensions.height20);
              }

              return DotsIndicator(
                dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
                position: _currPageValue,
                decorator: DotsDecorator(
                  activeColor: AppColors.mainColor,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              );
            }),

            //Popular text
            SizedBox(height: Dimensions.height30),

            Container(
              margin: EdgeInsets.only(left: Dimensions.width30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Bigtext(text: "Popular"),
                  SizedBox(width: Dimensions.width10),
                  Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: Bigtext(text: ".", color: Colors.black26),
                  ),
                  SizedBox(width: Dimensions.width10),
                  Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: Smalltext(text: "Food pairing"),
                  ),
                ],
              ),
            ),

            //list of food and images - এখানে Expanded সরিয়ে দিন
            Container(
              height: 800, // বা আপনার প্রয়োজন মতো height দিন
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(), // nested scrolling এড়ানোর জন্য
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        bottom: Dimensions.height10
                    ),
                    child: Row(
                      children: [
                        //image section
                        Container(
                          width: Dimensions.listViewImgSize,
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white38,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/image/food1.jpg"),
                            ),
                          ),
                        ),

                        //text container
                        Expanded(
                          child: Container(
                            height: Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(Dimensions.radius20),
                                  bottomRight: Radius.circular(Dimensions.radius20)
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: Dimensions.width10,
                                right: Dimensions.width10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Bigtext(text: "Nutritious fruit meal in China"),
                                  SizedBox(height: Dimensions.height10),
                                  Smalltext(text: "With chinese characteristics"),
                                  SizedBox(height: Dimensions.height10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: AppColors.iconColor1),
                                      IconAndTextWidget(
                                          icon: Icons.location_on_outlined,
                                          text: "1.7km",
                                          iconColor: AppColors.mainColor),
                                      IconAndTextWidget(
                                          icon: Icons.access_time_rounded,
                                          text: "32min",
                                          iconColor: AppColors.iconColor2),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageItem(int index, ProductModel product) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Colors.black : Colors.green,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        product.img != null
                            ? 'https://mvs.bslmeiyu.com/uploads/${product.img}'  // /uploads/ দিয়ে ট্রাই করুন
                            : "assets/image/food0.png"
                    )
                    //image: NetworkImage(product.img ?? "assets/image/food0.png") // API থেকে image ব্যবহার করুন
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(0, 5)
                  ),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0))
                ],
              ),
              child: AppColumn(text: product.name ?? "Chinese Side"), // API থেকে নাম ব্যবহার করুন
            ),
          ),
        ],
      ),
    );
  }
}