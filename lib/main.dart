import 'package:flutter/material.dart';
import 'package:flutter_note/providers/cart_provider.dart';
import 'package:flutter_note/providers/category_provider.dart';
import 'package:flutter_note/providers/product_provider.dart';
import 'package:flutter_note/providers/user_auth_provider.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_bar.dart';
import 'home_page.dart';
import 'image_slider.dart';
import 'my_order.dart';
import 'my_setting.dart';
import 'sign_in.dart';
import 'signup_screen.dart';
import 'splash_screen.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: UserAuthProvider()),
          ChangeNotifierProvider.value(value: CategoryProvider()),
          ChangeNotifierProvider.value(value: ProductProvider()),
          ChangeNotifierProvider.value(value: CartProvider()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<UserAuthProvider>(context, listen: false).getEmail();
    Provider.of<CategoryProvider>(context, listen: false).fetchCategory();
    Provider.of<ProductProvider>(context, listen: false).fetchProduct();
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      routes: <String, WidgetBuilder>{
        'signin': (BuildContext context) => SigninScreen(),
        'signup': (BuildContext context) => SignUp(),
        'home': (BuildContext context) => HomePage(),
        'splash': (BuildContext context) => SplashScreen(),
        'nav': (BuildContext context) => BottomNavigation(),
        'slider': (BuildContext context) => ImageSlider(),
        'order': (BuildContext context) => MyOrder(),
        'setting': (BuildContext context) => MySetting(),

        // 'detail': (BuildContext context) => CategoryDetail(),
        // 'addnote': (BuildContext context)=> AddNoteScreen(),
      },
      initialRoute: 'splash',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
