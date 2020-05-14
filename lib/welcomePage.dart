import 'package:flutter/material.dart';
import 'loginPage.dart';


class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _startButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
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
          'START',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  Widget _label() {
    return Container(
      margin: EdgeInsets.all(1.0),
      child: const Text(
        "BK Connect",
        style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w600, fontFamily: "SegoePrint"),
      ),
    );
  }

  Widget _logo() {
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
                _logo(),
                SizedBox(
                  height: 20,
                ),
                _label(),
                SizedBox(
                  height: 30,
                ),
                _startButton(),
              ],
            ),
          ),
      ),
    );
  }
}