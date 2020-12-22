import 'package:flutter/material.dart';
import 'package:flutter_note/providers/user_auth_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width:  MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height,
            ),
            painter:  HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text("Profile",
                    style: TextStyle(fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        ),
                    ),
                child: ListTile(
                  leading: Icon(
                    Icons.star_border,
                    color: Colors.green,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
                  ),
                  title: Text(
                    "My order",
                  ),
                ),
              ),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.settings_outlined,
                    color: Colors.green,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
                  ),
                  title: Text(
                    "My settings",
                  ),
                ),

              ),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.login_outlined,
                    color: Colors.green,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
                  ),
                  title: Text(
                    "Logout",
                  ),
                  onTap: () {
                    Provider.of<UserAuthProvider>(context, listen: false)
                        .saveEmail('');
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'signin', (route) => false);
                  },
                ),

              )
            ],
          ),
        ],
      ),
    );
  }
}
class HeaderCurvedContainer extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint()..color = Colors.green;
    Path path = Path()
    ..relativeLineTo(0, 150)
    ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
    ..relativeLineTo(0, -150)
    ..close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}