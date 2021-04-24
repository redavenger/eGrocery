import 'package:flutter/material.dart';
import 'package:flutter_note/utils/constants.dart';
import 'package:toast/toast.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(kDefaultPadding),
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
              Toast.show("Your item has been added to cart successfully!", context,backgroundColor: Colors.orangeAccent,
                  textColor: Colors.black, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
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
}
