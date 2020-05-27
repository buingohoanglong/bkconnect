import 'package:flutter/material.dart';
import 'signupPage.dart';
import 'forgotPasswordPage.dart';
import 'UserInfo.dart';



class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {

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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _logo(),
                        _entryField(
                          "Username", 
                          hintText: "Type your name here",
                          icon: Icon(Icons.person_pin, color: Colors.black, size: 50.0,),
                          onSave: (String val) {
                            _info.setName(val);
                          }
                        ),
                        _entryField(
                          "Password",
                          isPassword: true, 
                          hintText: "Type your password here",
                          icon: Icon(Icons.lock, color: Colors.black, size: 50.0,),
                          onSave: (String val) {
                            _info.setPassword(val);
                          }
                        ),
                        FormField(
                          builder: (FormFieldState<String> state) {
                            return _submitButton();
                          }
                        ),
                        _forgotPasswordLabel(),
                        _createAccountLabel(),
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(top: 40, left: 0, child: _backButton()),
              ],
            ),
          )
        )
      );
  }

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
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false, String hintText = '', Icon icon, FormFieldSetter<String> onSave}) {
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
          TextFormField(
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
            onSaved: onSave,
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        _key.currentState.save();
        print("Name: ${_info.getName()}");
        print("Password: ${_info.getPassword()}");
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Theme.of(context).buttonColor
        ),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white,),
        ),
      ),
    ); 
  }


  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: Text(
              'Register',
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


  Widget _forgotPasswordLabel() {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
        },
        child: Text(
          'Forgot Password ?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500, 
            color: Colors.blue
          ),
        ),
      ),
    );
  }

}