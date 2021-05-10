import 'package:flutter/material.dart';
import 'package:flutter_note/providers/user_auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'signup_screen.dart';
import 'utils/constants.dart';
import 'widgets/loading_indicator.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  var mailController = TextEditingController();
  var passController = TextEditingController();
  var email;
  var pass;

  bool _obscurePassword = true;
  final _globalKeyScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _globalKeyScaffold,
      body: Opacity(
        opacity: 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  cursorColor: Colors.grey,
                  controller: mailController,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Email',
                      labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.grey,
                  controller: passController,

                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: _obscurePassword
                          ? Icon(Icons.visibility,color: Colors.grey,)
                          : Icon(Icons.visibility_off,color: Colors.grey,),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    labelText: 'Enter Your Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      email = mailController.text;
                      pass = passController.text;

                      if (mailController.text.isEmpty ||
                          passController.text.isEmpty) {
                        showSnackBar("Fill All the details");
                      } else {
                        loginUser();
                      }
                    },
                    child: Text(
                      "SIGN IN",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 40, 100, 00),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Create an account ?'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 10, 100, 0),
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text(
                      "SIGN UP",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginUser() async {
    onLoading(context);
    var url = '$LOGIN_URL?email=$email&password=$pass';
    var response = await http.get(url);
    Navigator.pop(context);

    if (response.body.contains("Login")) {
      Provider.of<UserAuthProvider>(context,listen:false).saveEmail(email);
      // saveEmail();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomePage()),);
      Navigator.pushNamedAndRemoveUntil(context, 'nav', (route) => false);
    } else {
      showSnackBar("Invalid Email or Password Please Try Again");
    }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  // void saveEmail() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('email', email);
  // }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 7),
      content: Text('$message'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    _globalKeyScaffold.currentState.showSnackBar(snackBar);
  }
}
