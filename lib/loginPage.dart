import 'package:bkconnect/Authentication.dart';
import 'package:bkconnect/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'UserInfo.dart';
import 'dart:convert';
import 'widgets.dart' as wgt;
import 'basePage.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  UserInfo _info = UserInfo();
  Authentication _auth = Authentication();

  void submitCallback(http.Response response) {
    print(response.body);
    var msg = json.decode(response.body);
    if(msg["status"] == "success") {
      onSuccess(msg);
    }
    else {
      showAlertDialog(msg);
    }
  } 

  void onSuccess(Map<String, dynamic> msg) {
    var info = UserInfo.fromMap(msg["body"]);
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => BasePage(info: info))
    );
  }

  void showAlertDialog(Map<String, dynamic> msg) {
    showDialog(
      context: context,
      child: new AlertDialog(
        title: Text(
          msg["status"],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          msg["type"],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          new FlatButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
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
                              onTap: () async {
                                if(_key.currentState.validate()) {
                                  _key.currentState.save();
                                  try {
                                    var response = await _auth.signIn(_info);
                                    submitCallback(response);
                                  } catch(e) {
                                    print(e);
                                    var msg = {"status": "failure", "type": "lost connection"};
                                    showAlertDialog(msg);
                                  }
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