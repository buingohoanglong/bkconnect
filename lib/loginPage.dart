import 'package:bkconnect/Authentication.dart';
import 'package:bkconnect/profilePage.dart';
import 'package:flutter/material.dart';
import 'UserInfo.dart';
import 'dart:convert';
import 'widgets.dart' as wgt;



class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  UserInfo _info = UserInfo();
  Authentication auth = Authentication();

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
                  child: Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        wgt.Logo(),
                        wgt.EntryField(
                          "Username", 
                          hintText: "Type your name here",
                          icon: Icon(Icons.person_pin, color: Colors.black, size: 50.0,),
                          validator: (String val) {
                            return val.isEmpty ? "Username cannot be empty" : null;
                          },
                          onSave: (String val) {
                            _info.setName(val);
                          }
                        ),
                        wgt.EntryField(
                          "Password",
                          isPassword: true, 
                          hintText: "Type your password here",
                          icon: Icon(Icons.lock, color: Colors.black, size: 50.0,),
                          validator: (String val) {
                            return val.isEmpty ? "Password cannot be empty" : null;
                          },
                          onSave: (String val) {
                            _info.setPassword(val);
                          }
                        ),
                        FormField(
                          builder: (FormFieldState<String> state) {
                            return wgt.SubmitButton(
                              text: "Login",
                              onTap: () {
                                if(_key.currentState.validate()) {
                                  _key.currentState.save();
                                  auth.signIn(_info).then((response) {
                                    print(response.body);
                                    var user = UserInfo.fromJson(json.encode(json.decode(response.body)["body"]));
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(info: user)));
                                  });
                                }
                              },
                            );
                          }
                        ),
                        wgt.ForgotPasswordLabel(),
                        wgt.RegisterLabel(),
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(top: 40, left: 0, child: wgt.BackButton()),
              ],
            ),
          )
        )
      );
  }

}