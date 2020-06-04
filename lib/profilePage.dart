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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) return;
      this._selectedIndex = index;
    });
  }


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
              child: Text("Full Name:", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
            Padding(
              child:Text(widget.info.getName(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Padding(
              child: Text("Student ID:", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
            Padding(
              child: Text(widget.info.getID(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Padding(
              child: Text("Phone:", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
            Padding(
              child: Text(widget.info.getPhone(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Padding(
              child: Text("Email:", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
            Padding(
              child: Text(widget.info.getEmail(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)), 
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)
            ),
          ],
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
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
              ],
            ),
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xe5ffffff),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Nearby'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Camera'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
        ],
        currentIndex: this._selectedIndex,
        selectedItemColor: Color(0xff1588db),
        onTap: this._onItemTapped,
      ),
    );
  }
}