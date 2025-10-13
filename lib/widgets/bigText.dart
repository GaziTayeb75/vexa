import 'package:ecommercewithfirebase/utils/dimensions.dart';
import 'package:flutter/material.dart';

class Bigtext extends StatelessWidget {
   Color? color;
  final String text;
  double size;
  TextOverflow overflow;
   Bigtext({super.key, this.color = const Color(0xFF332d2b),
     required this.text,
   this.size=0,
     this.overflow=TextOverflow.ellipsis
   });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size ==0? Dimensions.font20:size,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
