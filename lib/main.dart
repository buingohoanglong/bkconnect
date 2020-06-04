import 'package:flutter/material.dart';
import 'welcomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BK Connect',
      theme: ThemeData(
         primarySwatch: Colors.blue,
         scaffoldBackgroundColor: Colors.white,
         backgroundColor: Colors.white,
         focusColor: Colors.red,
         buttonColor: Color(0xff1588db),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}