import 'package:bkconnect/UserInfo.dart';
import 'package:bkconnect/camera.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'ProfilePage.dart';
import 'nearbyPage.dart';
import 'newsPage.dart';


class BasePage extends StatefulWidget {
  BasePage({this.info});

  final UserInfo info;

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex;
  List<Widget> _pages;

  @override
  void initState() {
    _selectedIndex = 0;
    _pages = [
      HomePage(info: widget.info),
      NearbyPage(info: widget.info),
      CameraPage(info: widget.info),
      NewsPage(info: widget.info),
      ProfilePage(info: widget.info),
    ];
  }


  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) return;
      this._selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._pages[this._selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
//        tooltip: 'Camera',
        child: Icon(Icons.camera),
        elevation: 2.0,
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