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
         buttonColor: Color.fromARGB(0xFF, 0x00, 0xA9, 0xE2),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}