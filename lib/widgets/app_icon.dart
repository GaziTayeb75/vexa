import 'package:ecommercewithfirebase/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

   AppIcon({super.key, required this.icon,
      this.backgroundColor=Colors.white,
      this.iconColor= Colors.black,
     this.size=40});




  @override
  Widget build(BuildContext context) {
    return  Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor,
      ),
      child: Icon(icon,color: iconColor,
        size: Dimensions.iconSize16,),
    );
  }
}
