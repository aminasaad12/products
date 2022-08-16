


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/business_logic/bloc/product_bloc.dart';
import 'package:products/business_logic/bloc/product_state.dart';
import 'package:products/data/models/product_model.dart';
import 'package:products/presentation/widgets/product_item_widget.dart';


class ProductSscreen extends StatefulWidget {

  const ProductSscreen({Key? key}) : super(key: key);

  @override
  State<ProductSscreen> createState() => _ProductSscreenState();
}

class _ProductSscreenState extends State<ProductSscreen> {
  late List<Product>allproducts;
  late List<Product> searchedForproducts;
  bool isSearching =false;
  final TextEditingController _searchingEditingController = TextEditingController();


  void addtosearchingForproducts(String searchingproducts) {
    searchedForproducts=allproducts.where((products) =>
        products.category.toLowerCase().startsWith(searchingproducts)).toList();
    setState(() {

    });

  }
  List<Widget> IconButtonBuildAppbarAction() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: Colors.teal),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _StartSearch,
          icon: Icon(
            Icons.search,
            color: Colors.teal,
          ),
        ),
      ];
    }
  }


  void _StartSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      isSearching = true;
    });

  }
  void _stopSearching() {
    _clearSearch();

    setState(() {
      isSearching = false;
    });
  }
  void _clearSearch() {
    setState(() {
      _searchingEditingController.clear();
    });
  }


  // Widget BuildSearchTextFeild(){
  //   return Container(
  //     margin: const EdgeInsets.all(30.0),
  //     padding: const EdgeInsets.all(10.0),
  //     decoration: BoxDecoration(
  //         color: Colors.white,
  //         boxShadow: const [
  //           BoxShadow(color: Colors.grey, spreadRadius: 8),
  //           BoxShadow(color: Colors.tealAccent, spreadRadius: 5),
  //         ],
  //         borderRadius: BorderRadius.all(
  //           Radius.circular(20.0),
  //         )
  //     ),
  //     child: TextField(
  //       controller:_searchingEditingController ,
  //       cursorColor: Colors.black,
  //       decoration: InputDecoration(
  //           hintText: 'Searching product...',
  //           border: InputBorder.none,
  //           hintStyle: TextStyle(
  //             color: Colors.black,
  //             fontSize: 18.0,
  //
  //           )
  //       ),
  //       style: TextStyle(
  //           color: Colors.black,
  //           fontSize: 18.0,
  //           fontWeight: FontWeight.bold
  //
  //       ),
  //       onChanged:(SearchedProduct){
  //         addtosearchingForproducts(SearchedProduct);
  //       },
  //     ),
  //
  //
  //   );
  // }

  Widget BuildSearchTextFeild(){
    return TextField(
      controller: _searchingEditingController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Find a character....',
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontWeight: FontWeight.w900,

        ),
      ),
      style: TextStyle(
        fontSize: 19.0,
        color: Colors.white,
        fontWeight: FontWeight.w900,

      ),
      onChanged: (searchingproducts){
        addtosearchingForproducts(searchingproducts);
      },
    );
  }
  Widget buildBlocWidget() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          allproducts = (state).products;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }
  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.teal,
      ),
    );
  }
  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }
  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchingEditingController.text.isEmpty ?
      allproducts.length
          : searchedForproducts.length,
      itemBuilder:(ctx, index) {
        return ProductItem(
          product:_searchingEditingController.text.isEmpty ?
          allproducts[index]
              :searchedForproducts[index],
        );

      },
    );
  }

  @override
  void initState() {
   BlocProvider.of<ProductCubit>(context).getallProducts();
    super.initState();
  }
  Widget AppBarText(){
    return  Text('Characters',
      style: TextStyle(
        color: Colors.white,
      ),);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        leading: isSearching ? BackButton(color: Colors.teal,) : Container(),
        title: isSearching ? BuildSearchTextFeild() :AppBarText(),
        actions: IconButtonBuildAppbarAction(),
      ),

      body: Padding(
        padding: const EdgeInsets.only(
          top: 30.0
        ),
        child: buildBlocWidget(),
      ),
    );
  }
}