import 'package:flutter/material.dart';
import 'package:shoping_app/screens/carts_screen.dart';
import 'package:shoping_app/screens/home_screen.dart';
import 'package:shoping_app/screens/settings_screen.dart';

import '../models.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex=0;
  final List<BnItem> _bnItems=<BnItem>[
    const BnItem(widget: HomeScreen()),
    const BnItem(widget:CartsScreen()),
    const BnItem(widget: SettingsScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF162a40),
                  spreadRadius: 0,
                  blurRadius: 20
              )
            ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          child: BottomNavigationBar(
            onTap: (int index){
              setState(()=> _currentIndex= index);
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            showUnselectedLabels: false,
            selectedItemColor: Color(0xFFC38EB4),
            unselectedItemColor: Color(0xFF49E3D2),
            backgroundColor: Colors.black,
            //fixedColor: Color(0xFFe9abb1),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.white
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  activeIcon: Icon(Icons.shopping_cart),
                  label: 'Carts',
                  backgroundColor: Colors.white
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  activeIcon: Icon(Icons.settings),
                  label: 'Settings',
                  backgroundColor: Colors.white
              ),
            ],
          ),
        ),
      ),
        body: _bnItems[_currentIndex].widget,
    );
  }
}
