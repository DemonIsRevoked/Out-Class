import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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