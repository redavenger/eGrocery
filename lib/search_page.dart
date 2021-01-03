import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note/providers/product_provider.dart';
import 'package:provider/provider.dart';

import 'model/product.dart';
import 'product_detail_screen.dart';
import 'widgets/product_widget.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: productListWidget(),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.green,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextField(
                autofocus: true,
                onChanged: (value){
                  setState(() {
                    productList = Provider.of<ProductProvider>(context, listen: false).filterProductList(value);
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          )),
        ),
      ),
    );
  }

  Widget productListWidget(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productList.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ProductWidget(
        itemIndex: index,
        product: productList[index],
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                product: productList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
