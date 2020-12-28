import 'package:flutter/material.dart';
import 'package:flutter_note/providers/product_provider.dart';
import 'package:provider/provider.dart';

import 'model/product.dart';
import 'product_detail_screen.dart';
import 'utils/constants.dart';
import 'widgets/product_widget.dart';

class ProductListPage extends StatelessWidget {
  List<Product> productList = [];

  @override
  Widget build(BuildContext context) {
    productList = Provider.of<ProductProvider>(context).productList;

    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          // SearchBox(onChanged: (value) {}),
          // CategoryList(),
          SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView.builder(
                  // here we use our demo procuts list
                  itemCount: productList.length,
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
