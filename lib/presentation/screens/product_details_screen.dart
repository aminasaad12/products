
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import '../widgets/details_product_item_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
   ProductDetailsScreen({Key? key, required this.product}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
         body:SingleChildScrollView(
           child: ProducDetailstItem(product: product,),
         ),
    );
  }
}
