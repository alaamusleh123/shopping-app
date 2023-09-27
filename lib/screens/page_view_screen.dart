import 'package:flutter/material.dart';
import 'package:shoping_app/wedgits/text_style_wedget.dart';

import '../wedgits/constant.dart';
import '../wedgits/out_boarding_content.dart';
class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  late PageController _pageController;
  int _currentPage=0;
 // Widget _buildIndicator() {
 //    return Row(
 //      mainAxisAlignment: MainAxisAlignment.center,
 //      children: List<Widget>.generate(3, (int index) {
 //        return AnimatedContainer(
 //          duration: Duration(milliseconds: 300),
 //          width: _currentPage == index ? 15 : 10,
 //          height: 10,
 //          margin: EdgeInsets.symmetric(horizontal: 5),
 //          decoration: BoxDecoration(
 //            color: _currentPage == index ? Color(0xFF094A52) : Color(0xFFC38EB4),
 //            borderRadius: BorderRadius.circular(5),
 //          ),
 //        );
 //      }),
 //    );
 //  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController= PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible:  _currentPage < 1,
                child: TextButton(
                  onPressed: (){
                    _pageController.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.easeInCirc);
                  },

                  child: TextStyleWedgit(
                    text: 'SKIP',
                    color: Color(0xFF1B3358),
                  ),
                ),
                replacement: TextButton(
                    onPressed: (){},
                    child: TextStyleWedgit(
                      text: 'START',
                      size: 14,
                      fontWeight: FontWeight.bold,)
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int page){
                  setState(() {
                    _currentPage=page;
                  });
                },
                children: [
                  OutBoardingScreen(image: Image.asset('images/undraw_Order_confirmed_re_g0if.png'), title: 'Welcom To My App', subtitle: 'The shopping application shows you all the products you need',),
                  OutBoardingScreen(image: Image.asset('images/undraw_shopping_app_flsj.png'), title: 'You can complete the operations now', subtitle: '')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: _currentPage!=0,
                  child: IconButton(
                      onPressed: (){
                        _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInCirc);
                      }, icon: Icon(Icons.arrow_back_ios_rounded)),
                ),
                SizedBox(width: 100,),
                IconButton(
                    onPressed: (){
                      _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInCirc);
                    }, icon: Icon(Icons.arrow_forward_ios_rounded)),
                SizedBox(height: 70,),

              ],
            ),
            Visibility(
              visible: _currentPage==1,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: ElevatedButton(onPressed: (){
                Navigator.pushReplacementNamed(context, mainScreen);
               // Navigator.pushReplacementNamed(context, mainScreen);
              },
                child: Text('START'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 45),
                  backgroundColor: Color(0xFFC38EB4),
                ),
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

