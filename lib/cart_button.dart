import 'package:flutter/material.dart';
import 'package:flutter_note/providers/cart_provider.dart';
import 'package:flutter_note/providers/user_auth_provider.dart';
import 'package:flutter_note/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import 'model/cart.dart';
import 'model/product.dart';

class CartButton extends StatefulWidget {
  final Product product;

  const CartButton({Key key, this.product}) : super(key: key);
  @override
  _CartButtonState createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 5,
      ),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          FlatButton.icon(
            onPressed: () {
              addToCart();
              Toast.show("Your item has been added to cart successfully!", context,backgroundColor: Colors.orangeAccent,
                  textColor: Colors.black,
                  duration: Toast.LENGTH_LONG,
                  gravity:  Toast.CENTER);
            },
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.white,),
            label: Text(
              "Add to Cart",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void addToCart() {
    groceryCart cart= groceryCart(productName:widget.product.name,image: widget.product.image,
      email: Provider.of<UserAuthProvider>(context, listen: false).email,price: widget.product.price,
      quantity: counter.toString(),
    );
    Provider.of<CartProvider>(context,listen: false).addToCart(cart);
  }
}
