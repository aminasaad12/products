//API
//https://fakestoreapi.com/products

 class Product{

 late int id;
 late String title;
 late String price;
 late String description;
 late String category;
 late String image;



  Product.fromjson(Map<String,dynamic>json){

   id = json['id'];
   title = json['title'];
   price = json['price'].toString();
   description = json['description'];
   category = json['category'];
   image = json['image'];




  }



 }