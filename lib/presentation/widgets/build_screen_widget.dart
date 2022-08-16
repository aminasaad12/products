

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class SearchItem extends StatelessWidget {
  final Product product;

  const SearchItem({super.key, required this.product});


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,


            ),
            child: Container(
              height: 164,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(product.image),

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Text(product.category,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,

              ),),
          ),
        ],
      ),
    );
  }
}
