import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoping_app/api/Home_Models/products.dart';
import 'package:shoping_app/api/repository.dart';
import 'package:shoping_app/wedgits/text_style_wedget.dart';

import '../wedgits/product_items.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading= false;
  late ProductModel productData;
  late List<ProductModel> product;
  late List<ProductModel> allProducts;
  Repository repository= Repository();

  bool _isSearching =false;//هل بعمل سيرش ولا لا
  final _searchTextController = TextEditingController();//عشان لما ابحث عحرف معين
  late List<ProductModel> searchedForCharacter;

  // void search(String name)
  // {
  //   setState(() {
  //     product = product.where((element) => element.name.contains(name)).toList();
  //   });
  // }

  final List<String> images=["p5.jpg", "p3.jpg","p4.jpg","p2.jpg","p6.jpg"];


  Future<void> getData() async{
    setState(() {
      isLoading = true;
    });
    await repository.getProductData().then((value) {
      if(value.isEmpty)
        {
          return;
        }
      else{
        product = value;
       // allProducts = value;
        setState(() { // انتي كنتي ناسياها يا انسة الاء
          isLoading = false;
        });
      }
    });
  }

  Widget _buildSearchField(){
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.grey,
      decoration: const InputDecoration(
        hintText: 'Find a product... ',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Color(0xFF094A52), fontSize: 18),
      ),
      style: const TextStyle(color: Color(0xFF094A52), fontSize: 18),
      onChanged: (searchedCharacter){
        if(searchedCharacter.isEmpty)
        {
          print('searchedCharacter is empty');
          getData();
        }
        else{
          print('searchedCharacter is not empty');
          addSearchedForItemsToSearchedList(searchedCharacter);//هاي فنكشن عملتها تحت وظيفتها تاخود النص الي دخلتو على السيرش واتشوف العناصر الي بتخص هاد الحرف
        }
      },
    );
  }
  void addSearchedForItemsToSearchedList(searchedCharacter){
    //اللستة الي بدي احط فيها العناصر الي هعرضهم//
    // بقدر اغيرها ل contains
    setState(() {
      product = product.where(
              (productData) =>
                  productData.name.toLowerCase().startsWith(searchedCharacter)).toList();
    });
  }
  List<Widget> _buildAppBarActions(){
    if(_isSearching){
      return[
        IconButton(
            onPressed: (){
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear, color: Color(0xFF86A8CF),))
      ];
    }else{
      //في حالة ما بعمل سيرش
      return[
        IconButton(
            onPressed: _startSearch,
            icon: const Icon(Icons.search, color: Color(0xFF86A8CF),)
        ),
      ];
    }
  }
  void _startSearch(){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching= true;
    });
  }
  void _stopSearching(){
    _clearSearch();
    setState(() {
      _isSearching= false;
    });
  }
  void _clearSearch(){
    setState(() {
      _searchTextController.clear();//بيمسح الداتا الي في الكونترولير
    });
  }
  Widget _buildAppBarTitel(){
    return TextStyleWedgit(
      text: '',color: Colors.black87,
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  _isSearching ? _buildSearchField() : _buildAppBarTitel(),
        actions: _buildAppBarActions(),
        iconTheme: IconThemeData(color:Color(0xFF15297C) ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30,left: 10, right: 10),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyleWedgit(text: 'Electronic', color: Color(0xFF094A52),size: 30,),
              TextStyleWedgit(text: 'Collection', color: Color(0xFFC38EB4),size: 40,),
              SizedBox(height: 10,),
              CarouselSlider(
                items: [
                  //1st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('images/p5.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //2nd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image:  AssetImage('images/p3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //3rd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image:  AssetImage('images/p2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //4th Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image:  AssetImage('images/p6.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //5th Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image:  AssetImage('images/p4.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                //Slider Container properties
                options: CarouselOptions(
                  height: 210.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              SizedBox(height: 30,),
              TextStyleWedgit(text: 'New Collection',
                color: Color(0xFFC38EB4),
                size: 20,
              ),
              SizedBox(height: 30,),
              Container(
                child:
                isLoading?
                const Center(child: Text('Loading'),) :
                GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 132/214,
                      crossAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: product.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context,index){
                      return ProductItems(productModel: product[index],);
                    }),
              ),
            ],
          ),
        ),

      ),
    );
  }
  }

