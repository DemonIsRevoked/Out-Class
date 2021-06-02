import 'package:outclass/AuthPages/register.dart';
import 'package:outclass/Pages/notificationPage.dart';
import 'package:outclass/Pages/Student/classPageStu.dart';
import 'package:outclass/Pages/Teacher/classPageTech.dart';
import 'package:outclass/Pages/notificationPage.dart';
import 'package:outclass/Services/authentication.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outclass/colorses.dart';

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
    Noticepage(), //2
    CanteenPage(), //3
    General(), //4
    //2nd slot ========
    ClassTech(), //5
    ClassStud(), //6
    RegisterForm(), //7
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesList[_pageIndex],
      drawer: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.black.withOpacity(0.6)),
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.cyan.withOpacity(0.5),
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(90)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 43,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/d/9/a/d9a1058910_50163142_elon-musk1.jpg'),
                        radius: 42,
                      ),
                    ),
                    Text(
                      "Elon Musk",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        Text(
                          "Elonmusk888Tesla@gmail.com",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.grey),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 14,
                        )
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text("Home",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                trailing: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => General()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.white,
                  ),
                  title: Text("Account ",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  trailing: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.save_outlined,
                  color: Colors.white,
                ),
                title: Text("Saved",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                trailing: Icon(
                  Icons.save,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text("Setting",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                trailing: Icon(
                  Icons.settings_applications,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                title: Text("About Us",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                trailing: Icon(
                  Icons.people_alt_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              new Divider(
                thickness: 2,
                color: Colors.cyan.withOpacity(0.5),
                indent: 16,
                endIndent: 16,
              ),
              ListTile(
                title: Text("Help Center ",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
              ListTile(
                title: Text("Setting & Privacy ",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: OutlinedButton.icon(
                  style: TextButton.styleFrom(
                    side: BorderSide(color: Colors.cyan.withOpacity(0.7)),
                  ),
                  icon: Icon(
                    Icons.logout,
                    color: Colors.cyan.withOpacity(0.7),
                  ),
                  label: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
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
              pagesList[1] = pagesList[
                  UserManagement().handleRole(role: usersData['role'])];
            });
          }
          setState(() {
            _pageIndex = value;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.home, size: 28),
              title: Text(
                '   Home',
                style: TextStyle(fontSize: 17),
              ),
              activeColor: activeButton,
              inactiveColor: backOfButton),
          BottomNavyBarItem(
              icon: Icon(CupertinoIcons.book, size: 28),
              title: Text('WorkSpace'),
              activeColor: activeButton,
              inactiveColor: backOfButton),
          BottomNavyBarItem(
              icon: Icon(CupertinoIcons.suit_club, size: 28),
              title: Text(
                '  Club',
                style: TextStyle(fontSize: 17),
              ),
              activeColor: activeButton,
              inactiveColor: backOfButton),
          BottomNavyBarItem(
              icon: Icon(CupertinoIcons.shopping_cart, size: 28),
              title: Text('Canteen'),
              activeColor: activeButton,
              inactiveColor: backOfButton),
          BottomNavyBarItem(
              icon: Icon(Icons.storefront_rounded, size: 28),
              title: Text('Exchange'),
              activeColor: activeButton,
              inactiveColor: backOfButton)
        ],
      ),
    );
  }
}
