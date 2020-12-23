import 'package:flutter/material.dart';
import 'package:flutter_note/model/ecategory.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../category_detail.dart';


class CategoryWidget extends StatelessWidget {

  final ECategory eCategory;
  CategoryWidget(this.eCategory);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryDetail(eCategory)),
        );
      },
      child: Column(
        children: [
          Container(
              child: CircleAvatar(radius: 32, backgroundColor: Colors.black12,
                child: CachedNetworkImage(imageUrl: eCategory.image, height: 32,),)),
          Center(child: Text(eCategory.name),),
        ],
      ),
    );
  }
}