import 'package:flutter/material.dart';
import '../colorses.dart';

class CanteenPage extends StatelessWidget {
  const CanteenPage({Key key}) : super(key: key);

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
          title: Text('BUY/SELL'),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: Text(
            'Smart BUY/ SELL Facility\n'
                '           Coming Soon',
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
