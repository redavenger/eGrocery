import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySetting extends StatefulWidget {
  @override
  _MySettingState createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        // title: Text(
        //   'My Setting',
        //   style: TextStyle(fontSize: 20, color: Colors.black),
        // ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
      ),
      body: Container(
        padding: EdgeInsets.only(left:16, top:25, right:26),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text("Edit Profile", style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(0,10)
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/profile.jpg'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3, color: Colors.white),
                            color: Colors.green,
                          ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", "Prayag Joshi", false),
              buildTextField("Email", "redavenger0407@gmail.com",false),
              buildTextField("Password", "**********",true),
              SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed: (){},
                    child: Text("CANCEL",
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black
                    )),
                  ),
                  RaisedButton(
                    onPressed: (){},
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("SAVE",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.white, 
                    )),
                  ),
                ],
              )
            ]
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
                obscureText: isPasswordTextField ? showPassword : false,
                decoration: InputDecoration(
                  suffixIcon: isPasswordTextField ? IconButton(
                    onPressed: (){
                      setState(() {
                        showPassword= !showPassword;
                      });
                    },
                    icon: Icon(Icons.remove_red_eye,
                    color: Colors.grey,),
                  ) : null,
                  contentPadding: EdgeInsets.only(bottom: 4),
                  labelText: labelText,
                  labelStyle: TextStyle(color: Colors.grey),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText:  placeholder,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                )),
              ),
    );
  }
}
