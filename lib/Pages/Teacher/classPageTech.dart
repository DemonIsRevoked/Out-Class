import 'package:outclass/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassTech extends StatefulWidget {
  @override
  _ClassTechState createState() => _ClassTechState();
}

class _ClassTechState extends State<ClassTech> {

  Widget buildPage(String text) {
    return Container(
      color: backgroundColor,
      child:  Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 28),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('CLASSES'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorMain1,colorMain2],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          bottom: TabBar(
            //isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(
                  icon: Icon(Icons.menu_book, size: 30,),text: 'CLASS'),
              Tab(icon: Icon(Icons.rule,size: 30,), text: 'ATTENDANCE'),

            ],
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        body: TabBarView(
          children: [
            buildPage('Teachers Classes List'),
            buildPage('Attendance List'),

          ],
        ),

      ),
    );

  }
}
class ClassCard extends StatelessWidget {
  const ClassCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 21.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.access_time,
                  size: 40.0,
                  color: Colors.blue,
                ),
              ),
              SizedBox(width: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Joined Date",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "21 August 2020",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

