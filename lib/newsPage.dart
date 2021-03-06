import 'package:bkconnect/UserInfo.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';


class NewsPage extends StatefulWidget {
  NewsPage({this.info});

  final UserInfo info;

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {


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
        child: Text("This is NewsPage"),
      ),
    );
  }
  
}