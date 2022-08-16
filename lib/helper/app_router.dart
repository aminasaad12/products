



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/business_logic/bloc/product_bloc.dart';
import 'package:products/data/models/product_model.dart';
import 'package:products/data/respository/product_respository.dart';
import 'package:products/data/web_services/product_web_services.dart';

import '../constants/strings.dart';
import '../presentation/screens/product_details_screen.dart';
import '../presentation/screens/product_screen.dart';


class AppRouter{

  late ProductsRespository productsRespository;
  late ProductCubit productCubit;

  AppRouter(){
     productsRespository=ProductsRespository(ProductsWebServices());
     productCubit=ProductCubit(productsRespository);

  }

  Route? generateRoute(RouteSettings settings){
     switch(settings.name){
       case productscreen :
         return MaterialPageRoute(
             builder: (_)=>BlocProvider(
                 create: (BuildContext context)=>ProductCubit(productsRespository),
                 child: ProductSscreen()));
       case productdetailsscreen :
         final product =settings.arguments as Product;
         return MaterialPageRoute(
             builder: (context)=>ProductDetailsScreen(product: product,));
       // case productsearchsscreen :
       //   final product =settings.arguments as Product;
       //   return MaterialPageRoute(builder:(context)=> SearchScreen() );


     }
  }
}



//ProductCubit(ProductsRespository(ProductsWebServices())),