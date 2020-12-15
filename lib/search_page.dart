import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Opacity(
        opacity: 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/search.png'),
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.green,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          )),
        ),
      ),
    );
  }
}
