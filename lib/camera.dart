import 'package:bkconnect/UserInfo.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';


class CameraPage extends StatefulWidget {
  CameraPage({this.info});

  final UserInfo info;

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white),
        child: Text("This is Camera"),
      ),
    );
  }
  
}