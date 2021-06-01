import 'package:outclass/AuthPages/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

var color1 = Colors.blueGrey;
var color2 = Color(0xFFFFFFFF);
var color3 = Colors.white38;
var fontstyle = TextStyle(color: color2, fontFamily: 'Roboto1');
var fontstyle2 =
    TextStyle(color: color3, fontSize: 15.0, fontFamily: 'Roboto1');

class _SuccessState extends State<Success> {
  GlobalKey<FormState> regkey = GlobalKey<FormState>();

  void validate() {
    if (regkey.currentState.validate()) {
      print('ok');
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        primaryColorDark: color1,
      ),
      home: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Scaffold(
          backgroundColor: Color(0xFF000000),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Center(
                child: Container(
                  // color: color2,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'font/img/img1.gif',
                        height: 200.0,
                        width: 400.0,
                      ),
                      Text(
                        'SUCCESSFUL!',
                        style: TextStyle(
                            color: Color(0xE8ADEAD8),
                            fontFamily: 'Girassol',
                            fontSize: 30),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterForm(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            side: BorderSide(
                                color: color1,
                                style: BorderStyle.solid,
                                width: 3.0),
                            primary: Colors.black,
                            // shadowColor: Colors.red,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                          ),
                          child: Text(
                            'CLICK',
                            style: TextStyle(
                                color: color2,
                                fontSize: 25,
                                fontFamily: 'Girassol',
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
