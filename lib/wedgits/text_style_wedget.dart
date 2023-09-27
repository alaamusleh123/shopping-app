import 'package:flutter/material.dart';
class TextStyleWedgit extends StatelessWidget {
  double size;
  final String text;
  FontWeight fontWeight;
  Color? color;
  TextOverflow overFlow;//هاي ازا جملة وباقيها عبارة عن نقاط

   TextStyleWedgit({Key? key,
     required this.text,
     this.size=20,
     this.color,
     this.overFlow=TextOverflow.ellipsis,
     this.fontWeight=FontWeight.bold
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Text(
     text,
     style: TextStyle(
       color: color,
       fontWeight: fontWeight,
       fontSize: size,
       overflow: TextOverflow.ellipsis,
     ),

    );
  }
}
