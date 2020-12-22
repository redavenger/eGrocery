import 'package:flutter/material.dart';
import 'package:flutter_note/model/ecategory.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryWidget extends StatelessWidget {

  final ECategory eCategory;


  CategoryWidget(this.eCategory);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: CircleAvatar(radius: 32, backgroundColor: Colors.lightGreen,
              child: CachedNetworkImage(imageUrl: eCategory.image, height: 32,),)),
        Center(child: Text(eCategory.name),),
      ],
    );
  }
}