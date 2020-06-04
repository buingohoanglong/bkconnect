import 'package:bkconnect/Authentication.dart';
import 'package:bkconnect/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'UserInfo.dart';
import 'widgets.dart' as wgt;


class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => LoginPage())
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        "Id number", 
                        hintText: "Type your id number here",
                        keyboardType: TextInputType.number,
                        icon: Icon(Icons.format_list_numbered, color: Colors.black, size: 50.0,),
                        validator: (String val) {
                          return val.isEmpty ? "Id number cannot be empty" : null;
                        },
                        onSave: (String val) {
                          _info.setID(val);
                        }
                      ),
                      wgt.EntryField(
                        "Email",
                        hintText: "Type your email here",
                        keyboardType: TextInputType.emailAddress,
                        icon: Icon(Icons.email, color: Colors.black, size: 50.0,),
                        validator: (String val) {
                          if(val.isNotEmpty) {
                            bool isValidEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@hcmut\.edu\.vn").hasMatch(val);
                            return isValidEmail ? null : "Invalid email address";
                          }
                          return "Email cannot be empty";
                        },
                        onSave: (String val) {
                          _info.setEmail(val);
                        }
                      ),
                      wgt.EntryField(
                        "Phone number", 
                        hintText: "Type your phone number here",
                        keyboardType: TextInputType.number,
                        icon: Icon(Icons.phone_in_talk, color: Colors.black, size: 50.0,),
                        validator: (String val) {
                          return val.isEmpty ? "Phone number cannot be empty" : null;
                        },
                        onSave: (String val) {
                          _info.setPhone(val);
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
                            text: "Register",
                            onTap: () async {
                              if(_key.currentState.validate()) {
                                _key.currentState.save();
                                try {
                                  var response = await _auth.signUp(_info);
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
                      wgt.LoginLabel(),
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