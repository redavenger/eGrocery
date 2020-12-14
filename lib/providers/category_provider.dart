import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_note/model/ecategory.dart';
import 'package:flutter_note/utils/constants.dart';
import 'package:http/http.dart' as http;


class CategoryProvider extends ChangeNotifier {

  List<ECategory> ecategoryList = [];

  void fetchCategory() async {
    var url = '$READ_CATEGORY_URL';
    var response = await http.get(url);
     var result = jsonDecode(response.body);

     result.forEach((c){
       var ecategory = ECategory.fromJson(c);
       ecategoryList.add(ecategory);
     });
     notifyListeners();
  }

}
