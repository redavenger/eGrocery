import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note/model/ecategory.dart';
import 'package:flutter_note/model/product.dart';
import 'package:flutter_note/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ProductProvider extends ChangeNotifier {
  List<Product> productList = [];

  List<String> wish = [];

  void wishClick(String id){
    if(wish.contains(id)){
      removeWish(id);
    }else{
      addToWish(id);
    }
  }

  void fetchWishList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    wish = prefs.getStringList("wish") ?? [];
    wish = wish.toSet().toList();
    notifyListeners();
  }

  void removeWish(String id) async{
    Fluttertoast.showToast(
        msg: "Item removed from WishList",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
    wish.add(id);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('wish', wish);
    wish = wish.toSet().toList();
    notifyListeners();
  }

  void addToWish(String id) async{
    Fluttertoast.showToast(
        msg: "Item added to wishList",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
    wish.remove(id);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('wish', wish);
    wish = wish.toSet().toList();
    notifyListeners();
  }

  bool isWish(String id){
    for(var fav in wish){
      if(fav == id){
        return true;
      }
    }
    return false;
  }

  List<Product> filterProductByWish() {
    List<Product> filteredProduct = [];
    productList.forEach((product) {
      wish.forEach((element) {
        if (product.id == element) {
          filteredProduct.add(product);
        }
      });
    });
    return filteredProduct;
  }

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

  List<Product> filterProductByCategory(String category){
    List<Product> filteredProductList = [];
    productList.forEach((product) {
      if (product.cName.toLowerCase() == category.toLowerCase()){
        filteredProductList.add(product);
      }
    });

    return filteredProductList;
  }
}
