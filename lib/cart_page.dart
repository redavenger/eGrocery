import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_note/model/cart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';
import 'utils/constants.dart';
import 'widgets/cart_widget.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var phoneController = TextEditingController();
  var deliveryAddressController = TextEditingController();
  List<GroceryCart> cartItems = [];
  int selectedRadio;
  var phone;
  var deliveryAddress;

  final _globalKeyScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    cartItems = Provider.of<CartProvider>(context, listen: true).cartList;
    return Scaffold(
      key: _globalKeyScaffold,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.pink),
        title: Center(
          child: Text(
            'My Cart',
            style: GoogleFonts.greatVibes(
              textStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: IconButton(
                icon: Icon(Icons.favorite_outline_sharp),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'wishList');
                }),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          'Products Total:',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Rs. ${Provider.of<CartProvider>(context, listen: true).totalPrice.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                color: Colors.white,
                width: 450,
                height: 60,
                child: checkOutButton()),
          ],
        ),
      ),
      body: cartItems.isNotEmpty
          ? ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return CartWidget(cartItems[index]);
              })
          : Center(
              child: Opacity(
              opacity: 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/gif/1.gif'),
                    height: 125,
                  ),
                  Text(
                    "No items in your cart !!!",
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )),
    );
  }

  Widget checkOutButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: FlatButton(
        color: Colors.pink,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        splashColor: Colors.pinkAccent,
        child: Text(
          'CHECKOUT (${Provider.of<CartProvider>(context, listen: false).totalQuantity})',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onPressed: () {
          cartItems.isNotEmpty
              ? displayCheckOutDetailsOption()
              : displayNoOption();
        },
      ),
    );
  }

  void displayCheckOutDetailsOption() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fill up the form to confirm your order:',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: (Icon(
                              Icons.clear,
                              color: Colors.pink,
                              size: 30,
                            )),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  TextField(
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                      ),
                    ),
                    controller: phoneController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        labelText: 'Phone Number',
                        fillColor: Colors.pink),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                        ),
                      ),
                      controller: deliveryAddressController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.location_pin),
                          labelText: 'Delivery Address',
                          fillColor: Colors.pink),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 30),
                    child: Container(
                      width: 335,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15)),
                      child: FlatButton(
                        onPressed: () {
                          phone = phoneController.text;
                          deliveryAddress = deliveryAddressController.text;
                          if (phoneController.text.isEmpty ||
                              deliveryAddressController.text.isEmpty ||
                              phoneController.text.length != 10) {
                            Fluttertoast.showToast(
                                msg: "Data Incorrect/Invalid!!!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.blueGrey,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            addCart();

                            // Navigator.pop(context);
                          }
                        },
                        child: Text(
                          'Confirm',
                          style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void displayNoOption() {
    showSnackBar("No items to check out !!!");
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blueGrey,
      content: Text(
        message,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
    _globalKeyScaffold.currentState.showSnackBar(snackBar);
  }

  void addCart() async {
    cartItems.forEach((e) async {
      var url =
          "$ADD_CART_URL?product_name=${e.productName}&price=${e.price}&size=${e.size}&quantity=${e.quantity}&email=${e.email}&image=${e.image}&phone_number=$phone&delivery_address=$deliveryAddress";
      var response = await http.get(url);
      print(url);
      print(response.body.toString());
      if (response.body.toLowerCase().contains('success')) {
        Provider.of<CartProvider>(context, listen: false).removeFromCart(e);
      }
    });
    Navigator.pop(context);
    // Navigator.pop(context);
  }
}
