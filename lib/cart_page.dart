import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

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
              color: Colors.lightGreen,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 145,
                  child: Image(
                    image: AssetImage('assets/images/hulas.jpg'
                    ),
                  ),
                ), Padding(
                  padding: const EdgeInsets.only(top:25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("HULAS BASMATI ", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 15) ),

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
                            SizedBox(width: 80,),
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
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10),
                color: Colors.lightGreen,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 145,
                    child: Image(
                      image: AssetImage('assets/images/MAMYPOKO.jpg'
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.only(top:25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("MAMY POKO PANTS S 08'S", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 15) ),

                        Padding(
                          padding: const EdgeInsets.only(top:15),
                          child: Text("Quantity : 1", style:TextStyle( fontSize: 15)),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:30),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rs. 150", style:TextStyle( fontSize: 25)),
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
            ),
            SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10),
                color: Colors.black12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Billing Details:",style:TextStyle( fontSize: 25,fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order:',style:TextStyle( fontSize: 25)),
                      Text('Rs. 3150',style:TextStyle( fontSize: 25,fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipping:',style:TextStyle( fontSize: 25)),
                      Text('Rs. 100',style:TextStyle( fontSize: 25,fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TOTAL:',style:TextStyle( fontSize: 25)),
                      Text('Rs. 3250',style:TextStyle( fontSize: 25,fontWeight: FontWeight.bold))
                    ],
                  ),
                ),

              ],
            ),),
            SizedBox(height: 25,),
            Container(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: new BorderRadius.circular(16.0),
              ),
              height: 50,
              width: 390,
              child: FlatButton(
                child: Text("Place Order",style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 25)),
                onPressed:(){Toast.show("Order Placed Successfully!", context,backgroundColor: Colors.orangeAccent,
                    textColor: Colors.black, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);} ,),
            )
          ],
        ),
      ),
    );
  }
}
