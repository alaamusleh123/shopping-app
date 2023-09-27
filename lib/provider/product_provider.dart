import 'package:flutter/cupertino.dart';
import 'package:shoping_app/api/repository.dart';

import '../api/Home_Models/products.dart';
import '../screens/product_details_screen.dart';

class ProductProvider extends ChangeNotifier{
  // Repository repository= Repository();
   int itemCount=0;
   void addProduct(ProductModel product, int itemCount) {
    products.add(product);
    quantity.add(itemCount);
    notifyListeners();
  }
  void removeProduct(ProductModel product, int counter) {
    products.remove(product);
    quantity.remove(counter);

    notifyListeners();
  }
   void saveToCartScreen(ProductModel product) {
     savedCartProducts.add(product);
   }

  List<ProductModel> get cartProducts => products;
   List<int> get cartQuants => quantity;
   List<ProductModel> get savedCartProducts => savedCartProducts;
}