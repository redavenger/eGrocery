import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note/cart_page.dart';
import 'package:flutter_note/home_page.dart';
import 'package:flutter_note/profile_page.dart';
import 'package:flutter_note/search_page.dart';
import 'package:flutter_note/whishlist_page.dart';

class BottomNavigation extends StatefulWidget {

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final tabs=[
    Center(child: HomePage()),
    Center(child: SearchPage()),
    Center(child: CartPage()),
    Center(child: WhishlistPage()),
    Center(child: ProfilePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.green,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.green,
        height: 60,
        items: <Widget>[
          Icon(Icons.local_fire_department_outlined,size:20,color:Colors.black),
          Icon(Icons.search_outlined,size:20,color:Colors.black),
          Icon(Icons.shopping_cart_outlined,size:20,color:Colors.black),
          Icon(Icons.bookmark_outline_outlined,size:20,color:Colors.black),
          Icon(Icons.perm_identity_outlined,size:20,color:Colors.black),
        ],
        animationDuration: Duration(milliseconds: 200),
        index: _currentIndex,
        animationCurve: Curves.bounceInOut,
        onTap: (index){
          onTabTapped(index);
        },
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
