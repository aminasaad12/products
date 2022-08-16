

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/business_logic/bloc/product_state.dart';
import 'package:products/data/models/product_model.dart';
import 'package:products/data/respository/product_respository.dart';

class ProductCubit extends Cubit<ProductState>
{
  final ProductsRespository productsRespository;
  List<Product> products= [];

  ProductCubit(this.productsRespository) : super(ProductInitial());


  List<Product> getallProducts(){
    productsRespository.getallProducts()
        .then((products){
      emit(ProductLoaded(products));
      this.products=products;
    }
    );
return products;
}


}