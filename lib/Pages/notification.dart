import 'package:outclass/main.dart';
import 'package:flutter/material.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage ({Key key}) : super(key: key);

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
        title: Text('NOTIFICATION'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Text(
          '  Notifications from Techers\n'
          'and others',
          style: TextStyle(
            color: colorMain3,
            fontWeight: FontWeight.bold,
            fontSize: 35,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
