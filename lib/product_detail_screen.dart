import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note/providers/product_provider.dart';
import 'package:provider/provider.dart';

import 'cart_button.dart';
import 'model/product.dart';
import 'utils/constants.dart';

class ProductDetailScreen extends StatefulWidget {
  Product product;

  ProductDetailScreen({this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _Wishlist = false;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    _Wishlist = Provider.of<ProductProvider>(context, listen: true)
        .isWish(widget.product.id);
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Product Details',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Hero(
                        tag: '${widget.product.id}',
                        child: CachedNetworkImage(
                          imageUrl: widget.product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2),
                      child: Row(
                        children: [
                          Container(
                            width: 170,
                            child: AutoSizeText(
                              widget.product.name,
                              style: Theme.of(context).textTheme.headline6,
                              maxLines: 5,
                            ),
                          ),
                          // Text(
                          //   widget.product.name,
                          //   style: Theme.of(context).textTheme.headline6,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: IconButton(
                              icon: (_Wishlist
                                  ? Icon(Icons.bookmark,
                                      color: Colors.orangeAccent)
                                  : Icon(Icons.bookmark_outline_outlined,
                                      color: Colors.orangeAccent)),
                              iconSize: 40,
                              onPressed: () {
                                setState(
                                  () {
                                    Provider.of<ProductProvider>(context,
                                            listen: false)
                                        .wishClick(widget.product.id);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\RS ${widget.product.price}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kSecondaryColor,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              if (count > 1) {
                                setState(() {
                                  count = count - 1;
                                });
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '$count',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              if (count < 50) {
                                setState(() {
                                  count = count + 1;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                      child: Text(
                        widget.product.description,
                        style: TextStyle(color: kTextLightColor),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                  ],
                ),
              ),
              CartButton(
                product: widget.product,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductPoster extends StatelessWidget {
  const ProductPoster({
    Key key,
    @required this.size,
    this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
        // the height of this container is 80% of our width
        height: size.width * 0.8,

        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: size.width * 0.7,
              width: size.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            Image.asset(
              image,
              height: size.width * 0.75,
              width: size.width * 0.75,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
