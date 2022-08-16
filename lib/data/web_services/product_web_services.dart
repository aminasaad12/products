


import 'package:dio/dio.dart';
import 'package:products/constants/strings.dart';

class ProductsWebServices{

  late Dio dio;

  ProductsWebServices(){

     BaseOptions baseOptions =BaseOptions(
       baseUrl: baseUrl,
       receiveDataWhenStatusError: true,
       connectTimeout:20*1000 ,
       receiveTimeout:20*1000,
     );
     dio =Dio(baseOptions);
  }

  Future<List<dynamic>> getallProducts() async{
   try {
     Response response =await dio.get('products');
     return response.data;
   } catch (e) {
     print(e.toString());
     return [];
   }


}

}