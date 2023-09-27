class ProductModel
{
   int id;
   String image;
   List images;
   var price;
   var oldPrice;
   var discount;
   String name;
   String description;

   ProductModel({
   required this.id,
   required this.image,
     required this.images,
   required this.price,
   required this.oldPrice,
   required this.discount,
   required this.name,
   required this.description});

   factory ProductModel.fromJson(Map<String,dynamic> productMap){
     return ProductModel(
         id: productMap['id'],
         image: productMap['image'],
        images: productMap['images'],
         price: productMap['price'],
         oldPrice: productMap['oldPrice'],
         discount: productMap['discount'],
         name: productMap['name'],
         description: productMap['description'],
     );
   }
}
