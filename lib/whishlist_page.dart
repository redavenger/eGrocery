import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note/providers/product_provider.dart';
import 'package:flutter_note/utils/constants.dart';
import 'package:flutter_note/widgets/product_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/product.dart';

class WhishlistPage extends StatelessWidget {

  List<Product> productList = [];

  @override
  Widget build(BuildContext context) {
    productList = Provider.of<ProductProvider>(context, listen: false).filterProductByWish();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'My WhishList',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
      ),
      // body: SafeArea(
      //
      //   child: Column(
      //     children: <Widget>[
      //       Container(
      //         margin: EdgeInsets.symmetric(
      //           horizontal: kDefaultPadding,
      //           vertical: kDefaultPadding / 2,
      //         ),
      //         height: 160,
      //         child: Stack(
      //           alignment: Alignment.bottomCenter,
      //           children: <Widget>[
      //             Container(
      //               height: 136,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(22),
      //                 color: Colors.lightGreen,
      //                 boxShadow: [kDefaultShadow],
      //               ),
      //               child: Container(
      //                 margin: EdgeInsets.only(right: 10),
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(22),
      //                 ),
      //               ),
      //             ),
      //             Positioned(
      //               top: 0,
      //               right: 0,
      //               child: Container(
      //                 padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      //                 height: 160,
      //                 // image is square but we add extra 20 + 20 padding thats why width is 200
      //                 width: 200,
      //                 child: Image(
      //                   image: AssetImage('assets/images/hulas.jpg'),
      //                 ),
      //               ),
      //             ),
      //             Positioned(
      //               bottom: 0,
      //               left: 0,
      //               child: SizedBox(
      //                 height: 136,
      //                 // our image take 200 width, thats why we set out total width - 200
      //                 width: size.width - 200,
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: <Widget>[
      //                     Spacer(),
      //                     Padding(
      //                       padding: const EdgeInsets.symmetric(
      //                           horizontal: kDefaultPadding),
      //                       child: Text(
      //                         "HULAS BASMATI PREMIUM RICE 100KG",
      //                         style: Theme.of(context).textTheme.button,
      //                       ),
      //                     ),
      //                     // it use the available space
      //                     Spacer(),
      //                     Row(
      //                       children: [
      //                         Container(
      //                           padding: EdgeInsets.symmetric(
      //                             horizontal: kDefaultPadding * 1.5, // 30 padding
      //                             vertical: kDefaultPadding / 4, // 5 top and bottom
      //                           ),
      //                           decoration: BoxDecoration(
      //                             color: kSecondaryColor,
      //                             borderRadius: BorderRadius.only(
      //                               bottomLeft: Radius.circular(22),
      //                               topRight: Radius.circular(22),
      //                             ),
      //                           ),
      //                           child: Text(
      //                             "RS 1500",
      //                             style: Theme.of(context).textTheme.button,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      body: SingleChildScrollView(
        child:
        productList.isEmpty ?
        Center(child: Column(
          children: [
            SizedBox(height: 300),
            Text('Oops, there is nothing to show here !',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: Colors.blueGrey, fontSize: 15, fontWeight: FontWeight.bold),
              ),),
            Padding(
              padding: const EdgeInsets.only(top:15),
              child: Text('There are 0 items in your wishlist',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.pink, fontSize: 15),
                ),),
            ),
          ],
        ),)
            :
      Padding(
        padding: const EdgeInsets.all(16),
        child: StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: productList.length,
          crossAxisCount: 4,
          itemBuilder: (context, index) => ProductWidget(product:productList[index]),
          staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        ),
      ),
      ),
    );
  }
}
