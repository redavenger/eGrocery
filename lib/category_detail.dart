import 'package:flutter/material.dart';
import 'package:flutter_note/model/product.dart';
import 'package:flutter_note/providers/product_provider.dart';
import 'package:provider/provider.dart';

import 'model/ecategory.dart';
import 'product_detail_screen.dart';
import 'widgets/product_widget.dart';

class CategoryDetail extends StatefulWidget {

  final ECategory eCategory;

  CategoryDetail(this.eCategory);

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {

  List<Product> productList = [];


  @override
  Widget build(BuildContext context) {
    productList = Provider.of<ProductProvider>(context, listen: false).filterProductByCategory(widget.eCategory.cName);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          widget.eCategory.cName,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
      ),
      body: productListWidget(),
    );
  }


  Widget productListWidget(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productList.length,
      // physics: NeverScrollableScrollPhysics(),
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
