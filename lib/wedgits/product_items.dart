import 'package:flutter/material.dart';
import 'package:shoping_app/api/Home_Models/products.dart';

import 'package:shoping_app/screens/product_details_screen.dart';
import 'package:shoping_app/wedgits/text_style_wedget.dart';

import 'constant.dart';
class ProductItems extends StatelessWidget {
  final ProductModel productModel;
   ProductItems({Key? key, required this.productModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: Color(0xFFC38EB4),
      borderOnForeground: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 20,
      child: InkWell(
        onTap: ()=>Navigator.pushNamed(context, productDetailsScreen,arguments: productModel ),
        child: GridTile(
          child: Hero( //عشان لما اضغط على الصورة تكبر
            tag: productModel.id ,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child:Image.network(
                      productModel.image,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: TextStyleWedgit(
              text: productModel.name ,
              color: Colors.white,) ,
          ),

        ),
      ),
    );
  }
}
