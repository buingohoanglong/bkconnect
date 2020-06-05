import 'package:bkconnect/UserInfo.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';


class ProfilePage extends StatefulWidget {
  ProfilePage({this.info});

  final UserInfo info;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Widget _infoLabel() {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(2.0),
        1: FlexColumnWidth(3.0),
      },
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Padding(
              child: Text("Full name:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black)),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
            Padding(
              child:Text(widget.info.getName(), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xff828282))), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Padding(
              child: Text("Student ID:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black)), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
            Padding(
              child: Text(widget.info.getID(), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xff828282))), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Padding(
              child: Text("Phone:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black)), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
            Padding(
              child: Text(widget.info.getPhone(), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xff828282))), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Padding(
              child: Text("Email:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black)), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
            Padding(
              child: Text(widget.info.getEmail(), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xff828282))), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
          ],
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GeneralImage(
              size: MediaQuery.of(context).size.width * 0.5,
              image: Image.asset('assets/images/TC_avatar.png', fit: BoxFit.cover),
              roundRadius: 100.0,
            ),
            _infoLabel(),
            SubmitButton(
              text: "Sign out",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
  
}