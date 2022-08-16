
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products/data/models/product_model.dart';
import '../../constants/strings.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key,required this.product})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:
        [
           InkWell(
             onTap:()=>Navigator.
             pushNamed(context,productdetailsscreen, arguments: product),
             child: Hero(
               tag: product.id,
               child: Container(
                 height: 164,
                 width: 160,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(16),
                 ),
                 child: Image.network(product.image),

               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(
               top: 10.0,
             ),
             child: Text(product.category,
          style: TextStyle(
             fontSize: 16.0,
              color: Colors.grey,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,

          ),),
           ),
           Padding(
             padding: const EdgeInsets.only(
               top: 7.0
             ),
             child: Text('\$'+product.price,
               style: TextStyle(
                 fontSize: 15.0,
                 color: Colors.grey,
                 fontWeight: FontWeight.w900,
                 fontStyle: FontStyle.italic,

               ),
             ),
           ),

        ],
      ),
    );
  }
}
