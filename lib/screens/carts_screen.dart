import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/provider/product_provider.dart';
import 'package:shoping_app/screens/product_details_screen.dart';

import '../api/Home_Models/products.dart';
import '../wedgits/text_style_wedget.dart';
import 'main_screen.dart';
//int _counter = 0;
class CartsScreen extends StatefulWidget {


  const CartsScreen({Key? key}) : super(key: key);

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
 // late List<ProductModel> productCart;
  //int itemCount = 0;
  // double calculateTotal(List<ProductModel> products) {
  //   double total = 0.0;
  //   for (var product in products) {
  //     product.price= quantity.
  //     total += product.price;
  //   }
  //   return total;
  // }
  double calculateTotal(List<ProductModel> products, List<int> quantities) {
    if (products.length != quantities.length) {
      throw ArgumentError("Arrays must have the same length.");
    }
    double total = 0;
    for (int i = 0; i < products.length; i++) {
      total += products[i].price * quantities[i];
    }
    return total;
  }
  @override
  Widget build(BuildContext context) {
    final productProvider= Provider.of<ProductProvider>(context);
    final cart = Provider.of<ProductProvider>(context);
   // final cartProductsToShow= productProvider.cartProducts;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: TextStyleWedgit(
            text: 'Cart',
            color:Color(0xFF094A52) ,
            size: 20,
          ),
        backgroundColor: Colors.white,
          centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: cart.cartProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  final List<ProductModel> products = [];
                  // final product= cartProductsToShow[index];
                  return CartProductCard(cart, index);
                },
              ),
            ),
          ),
          Divider(thickness: 2,),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF094A52)),
                ),
                Text(
                  '\$ ${calculateTotal(products,quantity) } ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFC38EB4)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card CartProductCard(ProductProvider cart, int index) {
    return Card(
            margin: EdgeInsets.all(10),
            color:Color.fromARGB(200, 240, 200, 230) ,
            elevation: 10,
            shadowColor: Color(0xff1a364e),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(10,15,4,5),
              child: Row(
                children: [
                  Image.network(cart.cartProducts[index].image,
                    height: 80,
                    width: 80,
                    fit: BoxFit.contain,),
                  SizedBox(width: 10,),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [//Color(0xFF094A52)
                         TextStyleWedgit(
                             text: cart.cartProducts[index].name,
                           color:Color(0xFF094A52) ,
                           size: 20,
                           fontWeight: FontWeight.bold,
                         ),
                          SizedBox(height: 5,),
                         TextStyleWedgit(
                             text: '\$${cart.cartProducts[index].price.toString()}',
                           color: Color(0xFF094A52),
                           size: 15,
                         ),
                          TextStyleWedgit(text: quantity[index].toString()),
                          SizedBox(height: 5,),
                        ],),
                    ),
                  ),
                  SizedBox(width: 10,),
                  IconButton(
                      iconSize: 20,
                      onPressed: () {
                        cart.removeProduct(cart.cartProducts[index], cart.cartQuants[index]);
                      },
                      icon:const Icon(Icons.delete_outline,
                    color: Color(0xFF094A52),
                    size: 30,),
                  ),
                ],
              ),
            ),
          );
  }
}


