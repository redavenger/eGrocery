import 'package:flutter/material.dart';
import 'package:flutter_note/model/ecategory.dart';
import 'package:flutter_note/providers/category_provider.dart';
import 'package:flutter_note/providers/user_auth_provider.dart';
import 'package:flutter_note/widgets/category_widget.dart';
import 'package:provider/provider.dart';

import 'image_slider.dart';

class HomePage extends StatelessWidget {
  List<ECategory> ecategoryList = [];

  @override
  Widget build(BuildContext context) {
    ecategoryList =
        Provider.of<CategoryProvider>(context, listen: false).ecategoryList;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 88,
                child: DrawerHeader(
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.black,
                    onPressed: () {},
                    child: Text(
                      "ABOUT US",
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                ),
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  Provider.of<UserAuthProvider>(context, listen: false)
                      .saveEmail('');
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'signin', (route) => false);
                },
              )
            ]),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'e-Grocery',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
        actions: [
          IconButton(
            icon: Icon(
              Icons.call_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              print('Button clicked');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlider(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  'CATEGORIES',
                  style: TextStyle(fontSize: 30),
                ),
                FlatButton.icon(

                )
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            physics: NeverScrollableScrollPhysics(),
            // Generate 100 widgets that display their index in the List.
            children: List.generate(ecategoryList.length, (index) {
              return CategoryWidget(ecategoryList[index]);
            }),
          ),
        ],
      )),
    );
  }
}
