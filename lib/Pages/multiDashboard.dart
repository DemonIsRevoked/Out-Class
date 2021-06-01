
import 'package:outclass/AuthPages/register.dart';
import 'package:outclass/Pages/Student/classPageStu.dart';
import 'package:outclass/Pages/Teacher/classPageTech.dart';
import 'package:outclass/Pages/notification.dart';
import 'package:outclass/Services/authentication.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outclass/main.dart';

//Pages ==========
import 'canteen.dart';
import 'home.dart';
import 'package:outclass/Pages/profile.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _pageIndex = 0;
  List<Widget> pagesList = <Widget>[
    HomePage(), //0
    null, //1
    NotificationPage(), //2
    CanteenPage(), //3
    ProfilePage(), //4
    //2nd slot ========
    ClassTech(), //5
    ClassStud(), //6
    RegisterForm(), //7
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesList[_pageIndex],
      bottomNavigationBar: BottomNavyBar(
        animationDuration: Duration(milliseconds: 400),
        backgroundColor: backgroundColor,
        itemCornerRadius: 8,
        selectedIndex: _pageIndex,
        showElevation: true,
        // use this to remove appBar's elevation
        onItemSelected: (value) async {
          if (value == 1) {
            DocumentSnapshot usersData =
                await store.collection("Users").doc(auth.currentUser.uid).get();

            setState(() {
              pagesList[1] = pagesList[UserManagement().handleRole(role: usersData['role'])];
            });
          }
          setState(() {
              _pageIndex = value;
            });

        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.home, size: 28),
              title: Text('   Home',style: TextStyle(
                fontSize: 17
              ),),
              activeColor: Colors.white,
              inactiveColor: CupertinoColors.inactiveGray),
          BottomNavyBarItem(
              icon: Icon(CupertinoIcons.book, size: 28),
              title: Text('WorkSpace'),
              activeColor: Colors.white,
              inactiveColor: CupertinoColors.inactiveGray),
          BottomNavyBarItem(
              icon: Icon(CupertinoIcons.suit_club, size: 28),
              title: Text('  Club',style: TextStyle(
                fontSize: 17
              ),),
              activeColor: Colors.white,
              inactiveColor: CupertinoColors.inactiveGray),
          BottomNavyBarItem(
              icon: Icon(CupertinoIcons.shopping_cart, size: 28),
              title: Text('Canteen'),
              activeColor: Colors.white,
              inactiveColor: CupertinoColors.inactiveGray),
          BottomNavyBarItem(
              icon: Icon(Icons.storefront_rounded, size: 28),
              title: Text('Exchange'),
              activeColor: Colors.white,
              inactiveColor: CupertinoColors.inactiveGray)
        ],
      ),
    );
  }
}
