import 'package:flutter/material.dart';
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
                            onTap: () {
                              if(_key.currentState.validate()) {
                                _key.currentState.save();
                                print("Name: ${_info.getName()}");
                                print("ID: ${_info.getID()}");
                                print("Email: ${_info.getEmail()}");
                                print("Phone: ${_info.getPhone()}");
                                print("Password: ${_info.getPassword()}");
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