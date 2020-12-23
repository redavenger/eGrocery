import 'package:flutter/material.dart';

import 'model/ecategory.dart';

class CategoryDetail extends StatefulWidget {

  final ECategory eCategory;

  CategoryDetail(this.eCategory);

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          widget.eCategory.name,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is my category detail page'),
        ],
      ),
    );
  }
}
