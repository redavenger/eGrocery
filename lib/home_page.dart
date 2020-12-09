import 'package:carousel_pro/carousel_pro.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container( height: 88,
                child: DrawerHeader(
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.black,
                    onPressed: (
                        ) {
                    },
                    child: Text(
                      "ABOUT US",
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                ),
              ),
              ListTile(title: Text('Logout'),
                onTap: (){
                  saveEmail();
                  Navigator.pushNamedAndRemoveUntil(context, 'signin', (route) => false);
                },
              )
            ]
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        title: Text('e-Grocery', style: TextStyle(fontSize: 20, color: Colors.black),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          )
        ),
        actions: [
          IconButton(icon: Icon(Icons.call_outlined, color: Colors.black,), onPressed: (){
            print('Button clicked');
          },)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 250.0,
                  child: Carousel(
                    images: [
                      NetworkImage("https://static.vecteezy.com/system/resources/previews/000/154/102/original/supermarket-cart-vector.jpg"),
                      NetworkImage("https://image.shutterstock.com/image-vector/promo-sale-flyer-groceries-grocery-260nw-1778803349.jpg"),
                      NetworkImage("https://thumbs.dreamstime.com/z/grocery-shopping-promotional-sale-banner-grocery-shopping-promotional-sale-banner-fast-shopping-cart-full-fresh-colorful-food-168812706.jpg"),
                    ],
                    dotSize: 2,
                    dotSpacing: 10,
                    dotColor: Colors.green,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.transparent,
                    dotIncreasedColor: Colors.pink,
                  )
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  void saveEmail()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', '');
  }
}
