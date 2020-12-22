import 'package:flutter/material.dart';
import 'package:flutter_note/model/ecategory.dart';
import 'package:flutter_note/providers/category_provider.dart';
import 'package:flutter_note/widgets/category_widget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import 'image_slider.dart';

class HomePage extends StatelessWidget {
  List<ECategory> ecategoryList = [];

  @override
  Widget build(BuildContext context) {
    ecategoryList =
        Provider.of<CategoryProvider>(context, listen: true).ecategoryList;

    return Scaffold(
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
        child: new Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'CATEGORIES',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            categoryListWidget(),

            Container(
              height: 250,
              child: ImageSlider(),),
          ],
        ),
      ),
    );
  }

  Widget categoryListWidget() {
    return Container(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: ecategoryList.length,
        scrollDirection: Axis.horizontal,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext ctxt, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryWidget(ecategoryList[index]),
          );
        },
      ),
    );
  }
}
