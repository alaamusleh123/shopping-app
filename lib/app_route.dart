import 'package:flutter/material.dart';
import 'package:shoping_app/api/Home_Models/products.dart';
import 'package:shoping_app/auth/login_screen.dart';
import 'package:shoping_app/screens/launch_screen.dart';
import 'package:shoping_app/screens/main_screen.dart';
import 'package:shoping_app/screens/page_view_screen.dart';
import 'package:shoping_app/screens/product_details_screen.dart';
import 'package:shoping_app/wedgits/constant.dart';

import 'api/Home_Models/banners.dart';
class AppRouter{
  Route? generateRoute(RouteSettings settings ){
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(builder: (_)=>MainScreen());

      case launchScreen:
        return MaterialPageRoute(builder: (_)=>LaunchScreen());

      case pageViewScreen:
        return MaterialPageRoute(builder: (_)=>PageViewScreen());

      case loginScreen:
        return MaterialPageRoute(builder: (_)=>LoginScreen());


      case productDetailsScreen:
        final product= settings.arguments as ProductModel;
        return MaterialPageRoute(builder: (_)=> ProductDetailsScreen( productModel: product,));



    }
  }
}