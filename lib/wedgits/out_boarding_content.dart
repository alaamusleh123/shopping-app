import 'package:flutter/material.dart';

class OutBoardingScreen extends StatelessWidget {
  const OutBoardingScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final Image image ;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          SizedBox(height: 5,),

          Text(title,
            style: TextStyle(
                color:  Color(0xFF26425A),

                fontWeight: FontWeight.bold,
                fontSize: 14
            ),),
          SizedBox(height: 5,),
          Text(subtitle,
            style: TextStyle(
                color:  Color(0xFFC38EB4),

                fontWeight: FontWeight.bold,
                fontSize: 14
            ),)
        ],
      ),
    );
  }
}