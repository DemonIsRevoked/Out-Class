import 'package:flutter/material.dart';
import 'package:outclass/Services/authentication.dart';

import '../colorses.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  Animation cardAnimation, delayedCardAnimation, fabButtonAnim, infoAnimation;

  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    cardAnimation = Tween(begin: 0.0, end: -0.025).animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: controller));

    delayedCardAnimation = Tween(begin: 0.0, end: -0.05).animate(
        CurvedAnimation(
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            parent: controller));

    fabButtonAnim = Tween(begin: 1.0, end: -0.0008).animate(CurvedAnimation(
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
        parent: controller));

    infoAnimation = Tween(begin: 0.0, end: 0.025).animate(CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: controller));
  }

  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    controller.forward();
    return new AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {UserManagement().handleSignOut(context);
                  },
                )
              ],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colorMain1, colorMain2],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
              ),
              title: Text('HOME'),
              centerTitle: true,
              backgroundColor: Colors.cyan,
            ),
            body:
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(20.0),
                    child: Stack(
                      clipBehavior: Clip.none, children: <Widget>[
                        Positioned(
                          left: 20.0,
                          child: Container(
                            transform: Matrix4.translationValues(0.0, delayedCardAnimation.value * devHeight, 0.0),
                            width: 300.0,
                            height: 400.0,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        Positioned(

                          left: 10.0,
                          child: Container(
                            transform: Matrix4.translationValues(0.0, cardAnimation.value * devHeight, 0.0),
                            width: 300.0,
                            height: 400.0,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        Container(
                          width: 300.0,
                          height: 400.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image: AssetImage('assets/girls.jpeg'),
                                  fit: BoxFit.cover)),
                        ),
                        Positioned(
                          top: 320.0,
                          left: 15.0,
                          child: Container(
                            transform: Matrix4.translationValues(0.0, infoAnimation.value * devHeight, 0.0),
                            width: 270.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1.0,
                                      color: Colors.black12,
                                      spreadRadius: 2.0)
                                ]),
                            child: Container(
                              padding: EdgeInsets.all(7.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Kayla',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(width: 4.0),
                                      Image.asset(
                                        'assets/login.png',
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                      SizedBox(width: 110.0),
                                      Text(
                                        '5.8km',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 9.0),
                                  Container(
                                    child: Text(
                                      'Fate is wonderful.',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),

              ],
            ),
          );
        });
  }
}