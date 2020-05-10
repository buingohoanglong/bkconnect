import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false, String hintText = '', Icon icon}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText,
              icon: icon,
              border: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0))
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0))
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: EdgeInsets.symmetric(vertical: 25),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
         color: Theme.of(context).buttonColor),
      child: Text(
        'Register Now',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Login',
              style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      margin: EdgeInsets.all(2.0),
      padding: EdgeInsets.only(
        top: 70.0,
        bottom: 20.0,
        left: 70.0,
        right: 70.0,
      ),
      child: Image.asset('assets/images/hcmut.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.5,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _logo(),
                    _entryField(
                      "Username", 
                      hintText: "Type your name here",
                      icon: Icon(Icons.person_pin, color: Colors.black, size: 50.0,),
                    ),
                    _entryField(
                      "Id number", 
                      hintText: "Type your id number here",
                      icon: Icon(Icons.format_list_numbered, color: Colors.black, size: 50.0,)
                    ),
                    _entryField(
                      "Email",
                      hintText: "Type your email here",
                      icon: Icon(Icons.email, color: Colors.black, size: 50.0,)
                    ),
                    _entryField(
                      "Phone number", 
                      hintText: "Type your phone number here",
                      icon: Icon(Icons.phone_in_talk, color: Colors.black, size: 50.0,)
                    ),
                    _entryField(
                      "Password",
                      isPassword: true,
                      hintText: "Type your password here",
                      icon: Icon(Icons.lock, color: Colors.black, size: 50.0,)
                    ),
                    _submitButton(),
                    _loginAccountLabel(),
                  ],
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ), 
        )
      )
    );
  }
}