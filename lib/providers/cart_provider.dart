import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_note/model/cart.dart';
import 'package:flutter_note/utils/constants.dart';
import 'package:http/http.dart' as http;

class CartProvider extends ChangeNotifier {
  List<groceryCart> CartList = [];

  int totalPrice=0;
  int totalQuantity=0;
  var image;
  var name;
  String price;
  var size;



  void fetchCart() async {
    CartList = [];
    var url = '$READ_CART_URL';
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    result.forEach((c) {
      var fewaCart = groceryCart.fromJson(c);
      CartList.add(fewaCart);
    });
    notifyListeners();
  }
  void addToCart(groceryCart cart){
    totalQuantity +=int.parse(cart.quantity);
    var price=int.parse(cart.quantity) *int.parse(cart.price);
    totalPrice += price;
    CartList.add(cart);
    image=cart.image;
    name=cart.productName;
    size=cart.size;
    notifyListeners();

  }
  void removeFromCart(groceryCart cart){
    CartList.remove(cart);
    totalQuantity -=int.parse(cart.quantity);
    var price=int.parse(cart.quantity) *int.parse(cart.price);
    totalPrice -= price;
    notifyListeners();
  }
  void emptyFromCart(){
    CartList=[];
    totalQuantity =0;
    totalPrice = 0;
    notifyListeners();
  }
}