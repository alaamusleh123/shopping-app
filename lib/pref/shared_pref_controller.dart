

// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../screens/product_details_screen.dart';
// enum prefKeys{
//   loggedIn, email , language
// }
// class SharedPrefController{
//   static final SharedPrefController _instance= SharedPrefController._();
//   late SharedPreferences _sharedPreferences;
//
//   factory SharedPrefController(){
//     return _instance;
//   }
//   SharedPrefController._();
//
//   Future<void> initpref() async{
//     _sharedPreferences= await SharedPreferences.getInstance();
//   }
//   Future<void> save({required String email}) async{
//     await _sharedPreferences.setBool(prefKeys.loggedIn.toString(), true);
//     await _sharedPreferences.setString(prefKeys.email.toString(), email);
//   }
//   bool get loggedIn=> _sharedPreferences.getBool(prefKeys.loggedIn.toString()) ?? false;
//
//   Future<bool> changeLanguage(String language) async{
//     return await _sharedPreferences.setString(prefKeys.language.toString(), language);
//   }
//
//   String get language=> _sharedPreferences.getString(prefKeys.language.toString()) ?? 'en';
//
//   Future<bool> removeEmail() async{
//     return await _sharedPreferences.remove(prefKeys.loggedIn.toString());
//   }
//   Future<bool> remove({required String key}) async{
//     if(_sharedPreferences.containsKey(key)){
//       return await _sharedPreferences.remove(key);
//     }
//     return false;
//   }
//
//   Future<bool> clear() async{
//     return await _sharedPreferences.clear();
//   }
//   // static Future<SharedPreferences> get _instance1 async =>
//   //     await SharedPreferences.getInstance();
//   //
//   // Future<void> saveCartProducts(List<int> productIds) async {
//   //   final prefs = await _instance1;
//   //   prefs.setStringList('cartProducts', productIds.map((id) => id.toString()).toList());
//   }
//   // static Future<List<int>> loadCartProducts() async {
//   //   final prefs = await _instance;
//   //   final cartProductIds = prefs.getStringList('cartProducts') ?? [];
//   //   return cartProductIds.map((id) => int.parse(id)).toList();
//   // }
//
// // class CartStorage {
// //   static Future<SharedPreferences> get _instance async =>
// //       await SharedPreferences.getInstance();
// //
// //   static Future<void> saveCartProducts(List<int> productIds) async {
// //     final prefs = await _instance;
// //     prefs.setStringList('cartProducts', productIds.map((id) => id.toString()).toList());
// //   }
// //
// //   static Future<List<int>> loadCartProducts() async {
// //     final prefs = await _instance;
// //     final cartProductIds = prefs.getStringList('cartProducts') ?? [];
// //     return cartProductIds.map((id) => int.parse(id)).toList();
// //   }
// // }