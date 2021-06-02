import 'package:outclass/AuthPages/register.dart';
import 'package:flutter/material.dart';
import 'package:outclass/colorses.dart';
import 'login.dart';

class Default extends StatelessWidget {
  const Default({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorMain1, colorMain2],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        title: Text('Out-Class'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 350),
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secAnimation,
                          Widget child) {
                        animation = CurvedAnimation(
                            parent: animation, curve: Curves.easeInOutCirc);
                        return ScaleTransition(
                          alignment: Alignment.topRight,
                          scale: animation,
                          child: child,
                        );
                      },
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secAnimation) {
                        return Login();
                      }),
                );
              }),
          IconButton(
              icon: Icon(Icons.note_add_outlined),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 350),
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secAnimation,
                          Widget child) {
                        animation = CurvedAnimation(
                            parent: animation, curve: Curves.easeInOutCirc);
                        return ScaleTransition(
                          alignment: Alignment.topRight,
                          scale: animation,
                          child: child,
                        );
                      },
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secAnimation) {
                        return RegisterForm();
                      }),
                );
              }),
        ],
      ),
      body: Image.network('https://wallpaperaccess.com/full/1397066.jpg',
          fit: BoxFit.fill),
    );
  }
}
