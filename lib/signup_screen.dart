import 'package:flutter/material.dart';
import 'package:flutter_note/providers/user_auth_provider.dart';
import 'package:flutter_note/sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


import 'utils/constants.dart';
import 'widgets/loading_indicator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var unameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var cpassController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConPassword = true;
  final _globalKeyScaffold = GlobalKey<ScaffoldState>();
  var name;
  var email;
  var password;

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
              image: AssetImage('assets/images/background2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                TextField(
                  controller: unameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your username',
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Enter your email'),
                ),
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: _obscurePassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      labelText: 'Enter your Password'),
                  obscureText: _obscurePassword,
                ),
                TextFormField(
                  controller: cpassController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: _obscureConPassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscureConPassword = !_obscureConPassword;
                          });
                        },
                      ),
                      labelText: 'Enter your Confirm Password'),
                  obscureText: _obscureConPassword,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      name = unameController.text;
                      email = emailController.text;
                      password = passController.text;
                      if (unameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          passController.text.isEmpty ||
                          cpassController.text.isEmpty) {
                        showSnackBar(" fill the form");
                      } else {
                        registerUser();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => SigninScreen()),
                        // );
                      }
                    },
                    child: Text(
                      "SIGN UP",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 40, 100, 00),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already SIGN IN ?'),
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
                        MaterialPageRoute(builder: (context) => SigninScreen()),
                      );
                    },
                    child: Text(
                      "SIGN IN",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Button clicked');
        },
        child: Icon(Icons.add_ic_call_sharp),
        backgroundColor: Colors.green,
      ),
    );
  }

  void registerUser() async {
    onLoading(context);
    var url = '$SIGNUP_URL?name=$name&email=$email&password=$password';
    var response = await http.get(url);
    Navigator.pop(context);

    if (response.body.contains("Registration Successful")) {
      Provider.of<UserAuthProvider>(context,listen:false).getEmail();
      // saveEmail();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomePage()),);
      Navigator.pushNamedAndRemoveUntil(context, 'nav', (route) => false);
    } else if (response.body.contains("Email Already exists")) {
      showSnackBar("Email Already exists");
    } else {
      showSnackBar("Something is wrong");
    }
  }

  // void saveEmail() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('email', email);
  // }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 7),
      content: Text('$message'),
    );
    _globalKeyScaffold.currentState.showSnackBar(snackBar);
    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    //Scaffold.of(context).showSnackBar(snackBar);
  }
}
