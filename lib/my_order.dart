import 'package:flutter/material.dart';

class MyOrder extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'My order',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
      ),
      body: Container(
    child: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/images/background3.jpg'),
    fit: BoxFit.cover,
    ),
    ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('e-Grocery', style:
            TextStyle(fontSize: 40, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            Text(''),
            Text('Spare more with ‘e-Grocery’ ! We give you the most minimal costs on the entirety of your grocery needs.',
              style: TextStyle(fontSize: 15, color: Colors.black),textAlign: TextAlign.center),
            Text(''),
            Text('e-Grocery is a low-cost online general store that gets items crosswise over classifications like grocery, natural products and vegetables, excellence and health, family unit care, infant care, pet consideration and meats and fish conveyed to your doorstep.',
              style: TextStyle(fontSize: 15, color: Colors.black),textAlign: TextAlign.center),
            Text(''),
            Text('Browse more than 5,000 items at costs lower than markets each day!',
              style: TextStyle(fontSize: 15, color: Colors.black),textAlign: TextAlign.center),
          ],
        ),
      ),
      )
    );
  }
}
