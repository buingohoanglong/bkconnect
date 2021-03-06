import 'package:bkconnect/UserInfo.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';


class NearbyPage extends StatefulWidget {
  NearbyPage({this.info});

  final UserInfo info;

  @override
  _NearbyPageState createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {


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
        child: Text("This is NearbyPage"),
      ),
    );
  }
  
}