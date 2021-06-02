import 'package:outclass/Pages/multiDashboard.dart';
import 'package:outclass/Services/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../colorses.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

// variables ==============================================

var fontstyle = TextStyle(color: color2, fontFamily: 'Roboto1');
var fontstyle2 =
    TextStyle(color: color3, fontSize: 15.0, fontFamily: 'Roboto1');
//controller variables
TextEditingController uid = new TextEditingController();
TextEditingController password = new TextEditingController();
String email;

//variables====================================================
class _LoginState extends State<Login> {
  GlobalKey<FormState> logkey = GlobalKey<FormState>();
  GlobalKey<FormState> log2key = GlobalKey<FormState>();

  void validate() {
    if (logkey.currentState.validate()) {
      print('ok');
    } else {
      print('error');
    }
  }

  void validate2() {
    if (log2key.currentState.validate()) {
      print('ok');
    } else {
      print('error');
    }
  }

  bool visible = true;

  void _toogle() {
    visible = !visible;
    setState(() {});
  }

  _handleLogin() {
    store
        .collection('Authenticator')
        .doc(uid.text)
        .get()
        .then((DocumentSnapshot dsr) => email = dsr.get('email'));
    auth
        .signInWithEmailAndPassword(email: email, password: password.text)
        .then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // focusColor: Colors.grey,
        iconTheme: IconThemeData(
          opacity: 0.5,
        ),
        hintColor: color1,
        primaryColorDark: Colors.lightGreen,
        // bottomAppBarColor: Colors.green,
        buttonTheme: ButtonThemeData(
          minWidth: 150,
          height: 50,
        ),
      ),
      home: Scaffold(
        //   backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFF171717),
            bottom: PreferredSize(
                child: Container(
                  color: color1,
                  height: 4.0,
                ),
                preferredSize: Size.fromHeight(2.0)),

            //  centerTitle: true,
            title: Text(
              'WELCOME',
              style: TextStyle(
                  letterSpacing: 25,
                  color: color2,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'Girassol'),
            ),
            // elevation: 0.0,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: color1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/login.png',
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                            key: logkey,
                            controller: uid,
                            cursorColor: color2,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: color2),
                            //  autofocus:true,
                            autocorrect: true,
                            decoration: InputDecoration(
                                labelText: 'User',
                                labelStyle:
                                    TextStyle(color: color2, fontSize: 15.0),
                                hintText: ' USER ID',
                                hintStyle: fontstyle2,
                                filled: true,
                                //enabled: true,
                                focusColor: Color(0xFF343434),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: color1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0))),
                                prefixIcon: Icon(
                                  Icons.person_outline_rounded,
                                  size: 22.0,
                                  color: color2,
                                )),
                            validator:
                                RequiredValidator(errorText: 'Required')),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: password,
                          key: log2key,
                          cursorColor: color2,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: color2),
                          //  autofocus:true,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle:
                                  TextStyle(color: color2, fontSize: 15.0),
                              hintText: '  PASSWORD',
                              hintStyle: fontstyle2,
                              filled: true,
                              //enabled: true,
                              //fillColor: Color(0xDD242222),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              suffixIcon: InkWell(
                                  onTap: _toogle,
                                  child: Icon(
                                    visible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: color1,
                                  )),
                              prefixIcon: Icon(
                                Icons.lock_outline_sharp,
                                size: 22.0,
                                color: color2,
                              )),
                          obscureText: visible,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Required'),
                            MinLengthValidator(6,
                                errorText: 'More then six char')
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Forget password ? ',
                              style: TextStyle(
                                  color: color2,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  fontFamily: 'Raleway'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),

                        // ====================button =================================================================

                        ElevatedButton(
                            onPressed: _handleLogin,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              side: BorderSide(
                                  color: color2,
                                  style: BorderStyle.solid,
                                  width: 0.5),
                              primary: buttonLogin,
                              elevation: 3,
                              shadowColor: color2,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: Text(
                              'LOGIN',
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

        backgroundColor: Color(0xFF181818),
      ),
    );
  }
}
