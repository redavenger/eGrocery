import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: SizedBox(
            height: 200.0,
            child: Carousel(
              images: [
                NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/000/154/102/original/supermarket-cart-vector.jpg"),
                NetworkImage(
                    "https://image.shutterstock.com/image-vector/promo-sale-flyer-groceries-grocery-260nw-1778803349.jpg"),
                NetworkImage(
                    "https://thumbs.dreamstime.com/z/grocery-shopping-promotional-sale-banner-grocery-shopping-promotional-sale-banner-fast-shopping-cart-full-fresh-colorful-food-168812706.jpg"),
              ],
              dotSize: 4,
              dotSpacing: 15,
              dotColor: Colors.white,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.transparent,
              dotIncreasedColor: Colors.white,
            )),
      ),
    );
  }
}
