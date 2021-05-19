import 'package:flutter/material.dart';
import 'package:flutter_note/model/cart.dart';

class CartProvider extends ChangeNotifier {
  List<GroceryCart> cartList = [];

  int totalPrice = 0;
  int totalQuantity = 0;
  var image;
  var name;
  String price;
  var size;

  void addToCart(GroceryCart cart) {
    totalQuantity += int.parse(cart.quantity);
    var price = int.parse(cart.quantity) * int.parse(cart.price);
    totalPrice += price;
    cartList.add(cart);
    image = cart.image;
    name = cart.productName;
    size = cart.size;
    notifyListeners();
  }

  void removeFromCart(GroceryCart cart) {
    cartList.remove(cart);
    totalQuantity -= int.parse(cart.quantity);
    var price = int.parse(cart.quantity) * int.parse(cart.price);
    totalPrice -= price;
    notifyListeners();
  }

  void emptyFromCart() {
    cartList = [];
    totalQuantity = 0;
    totalPrice = 0;
    notifyListeners();
  }
}
