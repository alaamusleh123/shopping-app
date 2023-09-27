
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/api/Home_Models/banners.dart';
import 'package:shoping_app/api/Home_Models/products.dart';
import 'package:shoping_app/provider/product_provider.dart';
import 'package:shoping_app/screens/carts_screen.dart';
import 'package:shoping_app/wedgits/text_style_wedget.dart';


List<ProductModel> products=[];
List<int> quantity= [];

class ProductDetailsScreen extends StatefulWidget {
  late ProductModel productModel;

  ProductDetailsScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductProvider productProvider= ProductProvider();
  late List<ProductModel> product;

  int itemCount = 0;

  Widget buildSliverAppBar() {
    //السيلفر اب بتتحكملي بالصورة لما تكبر و النص او الاسم الي بيكون تحت بالنص
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Color(0xFF26425A)),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        // title: TextStyleWedgit(text: productModel.name,),
        //هاي الهيرو الي حطيتها في الهوم سكرين فوق الجردل فانا بدي استقبلها هان عشان امررلو الصورة فيها انيميشن
        background: Hero(
          tag: widget.productModel.id,
          child: Image.network(
            widget.productModel.image,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
              color: Color(0xFF094A52),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        TextSpan(children: [
          TextSpan(
            text: value,
            style: TextStyle(color: Color(0xFFC38EB4), fontSize: 16),
          ),
        ]),
      ]),
    );
  }

  void incrementItemCount() {
    setState(() {
      itemCount++;
    });
  }

  void decrementItemCount() {
    if (itemCount > 0) {
      setState(() {
        itemCount--;
      });
    }
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      color: Color(0xFF86ABCF),
      endIndent: endIndent,
      thickness: 2, //سمك الخط
    );
  }

  //  void addProduct(ProductModel productModel) {
  @override
  Widget build(BuildContext context) {
    //final productProvider= Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          // من خلال السليفر ليست هبدا اتحكم بالعناصر الي عندي الي تحت الصورة في البار
          SliverList(
            delegate: SliverChildListDelegate([
              //هاي العناصر الي هبدا اشتغل عليها تحت في البار فاعطيتو ليست
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('name: ', widget.productModel.name),
                    buildDivider(300),
                    characterInfo('price: ', widget.productModel.price.toString()),
                    buildDivider(300),
                    characterInfo(
                        'old_price: ', widget.productModel.oldPrice.toString()),
                    buildDivider(290),
                    characterInfo(
                        'discount: ', widget.productModel.oldPrice.toString()),
                    buildDivider(300),
                    characterInfo('description: ', widget.productModel.description),
                    buildDivider(260),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(height: 5,),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextStyleWedgit(
                          text: 'Required Quantity',
                          color: Color(0xFF094A52),
                          size: 20,
                        ),
                        SizedBox(width: 50,),
                        ElevatedButton(
                          child: TextStyleWedgit(text: '+',size: 30,color: Color(0xFF094A52),),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFC38EB4),
                              minimumSize: Size(0, 30),
                              shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )
                          ),
                          onPressed: () {
                            incrementItemCount();
                          },
                        ),
                        SizedBox(width: 10,),
                        TextStyleWedgit(
                          text: itemCount.toString(),
                          size: 25,
                          color: Color(0xFF094A52),
                        ),
                        SizedBox(width: 10,),

                        ElevatedButton(
                          child: TextStyleWedgit(text: '-',size: 30,color: Color(0xFF094A52),),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFC38EB4),
                              minimumSize: Size(0, 30),
                              shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )
                          ),
                          onPressed: () {
                            decrementItemCount();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextStyleWedgit(
                          text: 'Required Product',
                          color: Color(0xFF094A52),
                          size: 20,
                        ),
                        //SizedBox(width: 20,),
                        ElevatedButton(
                          onPressed: (){
                            //productProvider.addProduct(ProductModel as ProductModel);
                            productProvider.addProduct(widget.productModel, itemCount);
                            final snackBar =
                            SnackBar(content: TextStyleWedgit(
                              text: 'Added ${widget.productModel.name} to cart',
                            ),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.green,);
                            ScaffoldMessenger.of(context).showSnackBar(snackBar); },
                          child:  TextStyleWedgit(
                            text: 'add',
                            color: Color(0xFF094A52),
                            size: 20,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFC38EB4),
                            minimumSize: Size(0, 40),
                          ),
                        )
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       flex: 1,
                    //       child: ElevatedButton(
                    //         onPressed: (){
                    //           setStat(() {
                    //             ++_counter;
                    //           });
                    //         },
                    //         child: Icon(Icons.add, ),
                    //         style: ElevatedButton.styleFrom(
                    //           backgroundColor: Color(0xFFC38EB4),
                    //           minimumSize: Size(0, 40),
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(child:
                    //     Center(
                    //       child: TextStyleWedgit(
                    //         text: "\$ ${_counter.toString()}",
                    //         color: Color(0xFF094A52),
                    //         size: 26,
                    //           ),
                    //     )
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: ElevatedButton(
                    //         onPressed: (){
                    //           setStat(() {
                    //             --_counter;
                    //           });
                    //           ElevatedButton.styleFrom(
                    //               backgroundColor: Color(0xFFC38EB4)
                    //           );
                    //         },
                    //         child: Icon(Icons.minimize, ),
                    //         style: ElevatedButton.styleFrom(
                    //           backgroundColor: Color(0xFFC38EB4),
                    //           minimumSize: Size(0, 40),
                    //         ),
                    //       ),
                    //     ),
                    //
                    //   ],
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 500,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
