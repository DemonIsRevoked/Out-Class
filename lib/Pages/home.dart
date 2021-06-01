import 'package:outclass/Services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
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
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                UserManagement().handleSignOut(context);
              },
              child: Text("Sign out"),
            ),
          ),
        ));
  }
}
