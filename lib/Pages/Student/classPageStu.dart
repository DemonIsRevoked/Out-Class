import 'package:outclass/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassStud extends StatefulWidget {
  @override
  _ClassStudState createState() => _ClassStudState();
}

class _ClassStudState extends State<ClassStud> {
  Widget buildPage(String text) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Student page Triggered');
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
              backgroundColor: backgroundColor,
              elevation: 0,
              bottom: TabBar(
                  unselectedLabelColor: colorMain3,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), color: colorMain4),
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: colorMain3, width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("CLASS"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: colorMain3, width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("CLUB"),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          body: TabBarView(children: [
            Classes(),
            Classes(),
          ]),
        ));
  }
}

class Classes extends StatefulWidget {
  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text('Student Page Content', style: TextStyle( fontSize:20, color: colorMain3)),
      ),
    );
  }
}
