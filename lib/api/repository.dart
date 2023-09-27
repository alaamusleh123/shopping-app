import 'package:dio/dio.dart';
import 'package:shoping_app/api/Home_Models/products.dart';
import 'package:shoping_app/api/dio.dart';

import 'model_auth.dart';

class Repository{
DioProduct dioProduct= DioProduct();

Future<List<ProductModel>> getProductData()async
{
  Response response = await dioProduct.getAllProduct(path: 'home');
  List products = response.data['data']['products'];
  //return ModelHome.fromJson(response.data);
  return products.map((everyElementInTheList) => ProductModel.fromJson(everyElementInTheList)).toList();
}

Future<ModelAuth> login({required String email, required String password})async{
  Response response = await dioProduct.postData(
      path: 'login',
      data: {
        "email" : email,
        "password": password,
      }
  );
  return ModelAuth.fromJson(response.data);
}
}