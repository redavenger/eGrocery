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
     // bottomNavigationBar: CurvedNavigationBar(
     //   color: Colors.green,
     //   backgroundColor: Colors.white,
     //   buttonBackgroundColor: Colors.green,
     //   height: 60,
     //   items: <Widget>[
     //   Icon(Icons.local_fire_department_outlined,size:20,color:Colors.black),
     //   Icon(Icons.search_outlined,size:20,color:Colors.black),
     //   Icon(Icons.shopping_cart_outlined,size:20,color:Colors.black),
     //   Icon(Icons.bookmark_outline_outlined,size:20,color:Colors.black),
     //   Icon(Icons.perm_identity_outlined,size:20,color:Colors.black),
     // ],
     //   animationDuration: Duration(milliseconds: 200),
     //   index: 0,
     //   animationCurve: Curves.bounceInOut,
     //   onTap: (index){
     //    debugPrint("Current Index is $index");
     //   },
     // ),
    );
  }

  void saveEmail()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', '');
  }
}
