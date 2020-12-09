import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String email;

  startTime() async{
    var duration = Duration(seconds: 3);
    return Timer(duration, goToAnotherScreen);
  }

  goToAnotherScreen(){
    if (email.isEmpty){
      Navigator.pushReplacementNamed(context, 'signin');
    }else{
      Navigator.pushReplacementNamed(context, 'nav');
    }
  }

  getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email= prefs.getString('email')??'';
  }
  @override
  void initState() {
    super.initState();
    getEmail();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          Text('AppName'),
        ],
      ),
    );
  }
}
