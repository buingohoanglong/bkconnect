import 'package:flutter/material.dart';
import 'widgets.dart' as wgt;



class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  /*Widget _backButton() {
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
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,))
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
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(vertical: 15),
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
        'Send',
        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
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
  }*/


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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      wgt.Logo(),
                      wgt.EntryField(
                        "Email",
                        hintText: "Type your email here",
                        icon: Icon(Icons.email, color: Colors.black, size: 50.0)
                      ),
                      SizedBox(
                        height: 20, 
                      ),
                      wgt.SubmitButton(
                        text: "Send",
                        onTap: () {
                          print("Email: ");
                        },
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                    ],
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