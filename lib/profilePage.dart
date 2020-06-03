import 'package:bkconnect/UserInfo.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  ProfilePage({this.info});

  final UserInfo info;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget _signOutButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Theme.of(context).buttonColor),
        child: Text(
          'Sign out',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  Widget _label(String value) {
    return Container(
      margin: EdgeInsets.all(1.0),
      child: Text(
        value,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, fontFamily: "SegoePrint"),
      ),
    );
  }

  Widget _image() {
    return Container(
        margin: EdgeInsets.all(1.0),
        child: Image.asset('assets/images/hcmut.png'),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _image(),
                SizedBox(
                  height: 20,
                ),
                _label("Full Name: ${widget.info.getName()}"),
                SizedBox(
                  height: 30,
                ),
                _label("Student ID: ${widget.info.getID()}"),
                SizedBox(
                  height: 30,
                ),
                _label("Phone: ${widget.info.getPhone()}"),
                SizedBox(
                  height: 30,
                ),
                _label("Email: ${widget.info.getEmail()}"),
                SizedBox(
                  height: 30,
                ),
                _signOutButton(),
              ],
            ),
          ),
      ),
    );
  }
}