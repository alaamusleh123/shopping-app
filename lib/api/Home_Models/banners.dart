// class ModelHome{
//   late bool status;
//   late int id;
//   late String image;
//   late String category;
//   late String product;
//   late List<dynamic> products;
//   late int price;
//   late int oldPrice;
//   late int discount;
//   late String name;
//   late String description;
//
//   ModelHome({
//     required this.status,
//     required this.id,
//     required this.image,
//     required this.category,
//   required this.product,
//   required this.products,
//   required this.oldPrice,
//   required this.discount,
//   required this.price,
//   required this.name,
//   required this.description
//   });
//
//   factory ModelHome.fromJson(Map<String,dynamic> jsonData){
//     return ModelHome(
//         status: jsonData['status'],
//         data: jsonData['data'],
//         banners: jsonData['banners'],
//       id: jsonData['id'],
//       image: jsonData['image'],
//       category: jsonData['category'],
//       product: jsonData['product'],
//       products: jsonData['products'],
//       oldPrice: jsonData['oldPrice'],
//       discount:jsonData['discount'] ,
//       price:jsonData['price'],
//       name: jsonData['name'],
//       description: jsonData['description'],
//     );
//   }
// }