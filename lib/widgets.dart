import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'signupPage.dart';
import 'forgotPasswordPage.dart';
  

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            Text(
              'Back',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}



class EntryField extends StatelessWidget {
  String title;
  bool isPassword;
  String hintText;
  Icon icon;
  FormFieldSetter<String> onSave;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;

  EntryField(this.title, {this.isPassword = false, this.hintText = '', this.icon, 
            this.onSave, this.validator, this.keyboardType});
  
  @override
  Widget build(BuildContext context) {
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
            keyboardType: keyboardType,
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
            validator: validator,
            onSaved: onSave,
          )
        ],
      ),
    );
  }  
  }

class SubmitButton extends StatelessWidget {

  String text;
  GestureTapCallback onTap;

  SubmitButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(36)),
            color: Theme.of(context).buttonColor
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white,),
        ),
      ),
    ); 
  }
}



class RegisterLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
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
}


class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}


class ForgotPasswordLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
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


class LoginLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
}

class GeneralImage extends StatelessWidget {
  GeneralImage({@required this.size, @required this.image, this.roundRadius});

  double size;
  Image image;
  double roundRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(this.roundRadius),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(this.roundRadius)),
        child: this.image,
      ),
    );
  }
}

