import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../colorses.dart';
class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}
class _notificationState extends State<notification>{



  FlutterLocalNotificationsPlugin fltrNotification;
  @override
  void initState() {

    var androidInitilize = AndroidInitializationSettings('icon');
    var iosInitilize = IOSInitializationSettings();
    var initiliazationSettings =InitializationSettings( android: androidInitilize  , iOS: iosInitilize);
    fltrNotification = FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initiliazationSettings,onSelectNotification: notificationselected);
  }
  //shows notification
  Future _shownotifiaction()async{
    var androidDetails = AndroidNotificationDetails('user', 'after college', 'Hello',importance: Importance.max);
    var iosDetails = IOSNotificationDetails();
    var  generalNotificationDetails  = NotificationDetails(android: androidDetails,iOS: iosDetails);
    await fltrNotification.show(0, task, Task ,generalNotificationDetails );

  }
  var Task;
  var task;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.darkTheme(context),
      home: Scaffold(
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,60,20,20),
            child: Container(

              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('NOTIFY',style: TextStyle(fontSize: 40,color: Colors.white),),
                  Text('send notification to the student',style: TextStyle(fontSize: 15,color: Colors.white),),
                  SizedBox(height: 100,),
                  CupertinoFormSection(
                      decoration: BoxDecoration(color: CupertinoColors.separator,borderRadius: BorderRadius.circular(8),),
                      backgroundColor: CupertinoColors.black,
                      header: Text('Notification details',style: TextStyle(color: Colors.white),),
                      children: [
                        CupertinoFormRow( prefix: Icon(Icons.pending_actions_outlined,color: Colors.white,),
                            child: CupertinoTextFormFieldRow(
                              style: TextStyle(color: Colors.white),
                              placeholder: 'Enter Title',
                              onChanged: (_val){
                                task =  _val;
                              },
                            )),
                        CupertinoFormRow(prefix: Icon(Icons.open_in_browser_outlined,color: Colors.white,),
                            child: CupertinoTextFormFieldRow(
                              style: TextStyle(color: Colors.white),
                              maxLines: 2,
                              textInputAction: TextInputAction.newline,
                              placeholder: 'Enter Description',
                              // decoration: BoxDecoration(color: Colors.white38,borderRadius: BorderRadius.circular(5) ),
                              onChanged: (_val){
                                Task =  _val;
                              },
                            )),
                      ]),
                  SizedBox(height: 40,),
                  Center(
                      child: ElevatedButton(
                        child: Text('Notify',style: TextStyle(fontSize: 20),),
                        onPressed:_shownotifiaction,
                        style: ElevatedButton.styleFrom(

                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10)
                        ),
                      ))

                ],
              ),
            ),
          ),
        ),



      ),

    );

  }
  Future notificationselected (String payload)async{

  }
}

class MyTheme {
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.red,
      canvasColor: CupertinoColors.black,
      fontFamily: 'Raleway',
      scaffoldBackgroundColor: CupertinoColors.black,
      iconTheme: IconThemeData(color: CupertinoColors.activeBlue),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        centerTitle: true,
        color: CupertinoColors.black,
      ));
}

class Noticepage extends StatefulWidget {
  @override
  _NoticepageState createState() => _NoticepageState();
}

class _NoticepageState extends State<Noticepage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
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
            title: Text('NOTIFCATION'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Divider(
                color: Colors.white,
              ),
            ),
          ),
          bottomSheet: InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => notification()),
              );
            },
            child: Container(
              color: backgroundColor,
              width: double.infinity,
              height: 40,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                    child: Text(
                      'Send Notification',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          letterSpacing: 2),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
