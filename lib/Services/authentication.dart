import 'package:outclass/AuthPages/defaultPage.dart';
import 'package:outclass/Pages/multiDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;
final store = FirebaseFirestore.instance;

class UserData {
  setUserData() async {}
}

class UserManagement {
  handleAuth() {
    var page;
    if (auth.currentUser == null) {
      page = Default();
    } else {
      page = Dashboard();
    }
    return MaterialApp(
      home: page,
    );
  }

  handleSignOut(BuildContext context) {
    auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Default()),
    );
  }

 int handleRole({role}) {
    int data;
    print('Outside function');
    print(role);
    switch (role) {
      case "TECH":
        data = 5;
        break;
      case "STUD":
        data =6;
        break;
      case "ADMN":
        data = 7;
        break;
    }
  return data;
  }

}
