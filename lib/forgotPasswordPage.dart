import 'package:bkconnect/UserInfo.dart';
import 'package:flutter/material.dart';
import 'widgets.dart' as wgt;



class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  UserInfo _info = UserInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
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
                          "Email",
                          hintText: "Type your email here",
                          icon: Icon(Icons.email, color: Colors.black, size: 50.0),
                          onSave: (String val) {
                            _info.setEmail(val);
                          },
                        ),
                        SizedBox(
                          height: 20, 
                        ),
                        FormField(
                          builder: (FormFieldState<String> state) {
                            return wgt.SubmitButton(
                              text: "Send",
                              onTap: () {
                                _key.currentState.save();
                                print("Email: ${_info.getEmail()}");
                              },
                            );
                          }
                        ),
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