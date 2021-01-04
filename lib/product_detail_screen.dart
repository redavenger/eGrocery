import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'cart_button.dart';
import 'model/product.dart';
import 'utils/constants.dart';

class ProductDetailScreen extends StatelessWidget {

  Product product;


  ProductDetailScreen({this.product});

  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return Scaffold(
      backgroundColor: Colors.green,
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
                        tag: '${product.id}',
                        child: CachedNetworkImage(
                          imageUrl: product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2),
                      child: Row(
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 140),
                            child: Icon(
                              Icons.bookmark_outline_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\RS ${product.price}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kSecondaryColor,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '10',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                      child: Text(
                        product.description,
                        style: TextStyle(color: kTextLightColor),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                  ],
                ),
              ),
              CartButton(
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
