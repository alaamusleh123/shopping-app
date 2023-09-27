import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/provider/product_provider.dart';
import 'package:shoping_app/screens/launch_screen.dart';
import 'package:shoping_app/screens/main_screen.dart';
import 'package:shoping_app/screens/page_view_screen.dart';
import 'package:shoping_app/screens/product_details_screen.dart';

import 'app_route.dart';
void main(){
  runApp(MyApp(appRouter: AppRouter(),));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key,required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=> ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}

