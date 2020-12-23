import 'package:flutter/material.dart';

class MySetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'My Setting',
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
          Text('This is my setting page'),
        ],
      ),

    );
  }
}
