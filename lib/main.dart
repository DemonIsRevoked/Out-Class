import 'package:outclass/Services/authentication.dart';
//external files-------------
import 'package:firebase_core/firebase_core.dart';
//bottom nav bar -----------------
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Services/authentication.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(UserManagement().handleAuth());
}
//Color scheme ============================

Color backgroundColor = Color(0xFF1D2E4A), //backgroundColor
    colorMain1 = Color(0xFF0E1F3D), //topGradient1
    colorMain2 = Color(0xFF01286B), //topGradient2
    colorMain3 = Color(0xFFFFFFFF), //TextColor
    colorMain4 = Color(0xFF3682F6), //NavBarColor
    colorMain5 = Color(0xAF0E1F3D); //buttonColor
//Colors ==================================

