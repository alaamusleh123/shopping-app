import 'package:flutter/material.dart';

import '../wedgits/constant.dart';
import '../wedgits/text_style_wedget.dart';
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushReplacementNamed(context, pageViewScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            'images/8533fb47ef38e65fb04ecac16cf7b7c7.jpg',
            height: double.infinity,
            fit: BoxFit.fitWidth,),

        ],
      ),
      // body: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: AlignmentDirectional.topStart,
      //         end: AlignmentDirectional.bottomEnd,
      //         colors: [
      //           Color(0xFFC38EB4),
      //           Color(0xFFE1CBD7),
      //           Color(0xFF86ABCF),
      //
      //
      //         ]
      //     ),
      //   ),
      //   child: Center(
      //     child: Text(
      //         'Shopping App',
      //         style: TextStyle(
      //           fontSize: 24,
      //           fontWeight: FontWeight.bold,
      //           color: Color(0xFF1B3358),
      //         ),
      //
      //     ),
      //   ),
      // ),
    );
  }
}
