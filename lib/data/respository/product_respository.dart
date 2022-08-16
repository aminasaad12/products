

import '../models/product_model.dart';
import '../web_services/product_web_services.dart';

class ProductsRespository{

  final ProductsWebServices productsWebServices;

  ProductsRespository(this.productsWebServices);


  Future<List<Product>>getallProducts() async{

    final products = await productsWebServices.getallProducts();
    return products.map((product) =>Product.fromjson(product)).toList();


}
}