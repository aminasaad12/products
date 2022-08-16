


import '../../data/models/product_model.dart';

abstract class ProductState{}

class ProductInitial extends ProductState{}

class ProductLoaded extends ProductState{

  final List<Product>products;

  ProductLoaded(this.products);


}
