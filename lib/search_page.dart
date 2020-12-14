import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 0, start: 1, end: 15, bottom: 600),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        width: _folded ? 56 : 350,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.green,
          boxShadow: kElevationToShadow[6],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16),
                child: !_folded
                    ? TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none),
                )
                    : null,
              ),
            ),
            Container(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_folded ? 32 : 0),
                    topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(_folded ? 32 : 0),
                    bottomRight: Radius.circular(32),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      _folded ? Icons.search : Icons.close,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _folded = !_folded;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}