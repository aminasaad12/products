

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class ProducDetailstItem extends StatelessWidget {
  final Product product;

  const ProducDetailstItem({super.key, required this.product});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ),
          ),
          child: Hero(
            tag: product.id,
            child: Image.network(product.image,
              height: 50.0,
              width: 50.0,),
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 160.0
          ),
          child: Text('\$'+product.price,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 150.0
          ),
          child: Container(
            child: Text(product.category,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0
          ),
          child: Container(
            child: Text(product.title,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic
              ),),
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0
          ),
          child: Container(
            child: Text(product.description,
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic
              ),),
          ),
        ),
      ],
    );
  }
}
