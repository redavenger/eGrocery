import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:8.0,right: 8.0, top: 15, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(10),
              color: Colors.orangeAccent,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image(
                    image: AssetImage('assets/images/hulas.jpg'
                    ),
                  ),
                ), Padding(
                  padding: const EdgeInsets.only(top:25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("HULAS BASMATI PREMIUM RICE 10KG", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 15) ),

                      Padding(
                        padding: const EdgeInsets.only(top:15),
                        child: Text("Quantity : 2", style:TextStyle( fontSize: 15)),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:30),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rs. 1500", style:TextStyle( fontSize: 25)),
                            SizedBox(width: 99,),
                            IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                print('delete');
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
              ),
            SizedBox(height: 475,),
            Container(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: new BorderRadius.circular(16.0),
              ),
              height: 50,
              width: 390,


              child: FlatButton(
                child: Text("Place Order",style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 25)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
