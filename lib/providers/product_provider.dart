import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_note/model/ecategory.dart';
import 'package:flutter_note/model/product.dart';
import 'package:flutter_note/utils/constants.dart';
import 'package:http/http.dart' as http;


class ProductProvider extends ChangeNotifier {

  List<Product> productList = [];

  void fetchProduct() async {
    productList = [];
    var url = '$READ_PRODUCT_URL';
    var response = await http.get(url);
     var result = jsonDecode(response.body);

     result.forEach((c){
       var product = Product.fromJson(c);
       productList.add(product);
     });
     notifyListeners();
  }

  List<Product> filterProductList(String query){
    List<Product> filteredProductList = [];
    productList.forEach((product) {
      if (product.name.toLowerCase().contains(query.toLowerCase())){
        filteredProductList.add(product);
      }
    });

    return filteredProductList;
  }

}
