import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:outclass/Services/authentication.dart';

var backgroundColorF = Color(0xFF171717);
var color2 = Color(0xFFFFFFFF);
var color1 = Colors.cyanAccent;
var color3 = Colors.white60;
var fontStyle = TextStyle(color: color2, fontFamily: 'Roboto1');
var fontStyle2 =
    TextStyle(color: color3, fontSize: 15.0, fontFamily: 'Roboto1');

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        focusColor: Colors.cyan,
        iconTheme: IconThemeData(
          opacity: 0.5,
        ),
        hintColor: color1,
        primaryColorDark: Colors.black,
        // bottomAppBarColor: Colors.green,
        buttonTheme: ButtonThemeData(
          minWidth: 220,
          height: 60,
        ),
      ),
      home: Scaffold(
        //   backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFF181818),
            bottom: PreferredSize(
                child: Container(
                  color: color1,
                  height: 4.0,
                ),
                preferredSize: Size.fromHeight(2.0)),

            //  centerTitle: true,
            title: Text(
              'REGISTRATION',
              style: TextStyle(
                  letterSpacing: 5,
                  color: color2,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Girassol',
                  fontSize: 25),
            ),
          ),
        ),
        body: Register(),
        backgroundColor: Color(0xFF171717),
      ),
    );
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> regKey = GlobalKey<FormState>();

  //variables to retrieve data
  TextEditingController fullName = new TextEditingController();
  TextEditingController rollNo = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController coPassword = new TextEditingController();

  String branch, role;
  List listItem = ['CS', 'ME', 'CE', 'EC'];
  List typeList = ['STUD', 'TECH', 'ADMN'];

//variables----------------

  _handleRegister() {
    if (password.text != coPassword.text) {
      print('password Error');
    } else {
      String uid = role + branch + rollNo.text;
      Map<String, dynamic> data1 = {"email": email.text, "role": role};
      Map<String, dynamic> data2 = {
        "Branch": branch,
        "Id Number": rollNo.text,
        "E-Mail": email.text,
        "Name": fullName.text,
        "role": role
      };

      auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        store.collection("Users").doc(auth.currentUser.uid).set(data2);
        store.collection("Authenticator").doc(uid).set(data1);
        auth.currentUser.updateProfile(displayName: fullName.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 35),
        child: Center(
          child: Form(
            // autovalidateMode: AutovalidateMode.always, key: regkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                    controller: fullName,
                    cursorColor: color2,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: color2),
                    //  autofocus:true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        //labelStyle: TextStyle(color: color2,fontSize: 15.0),
                        labelStyle: fontStyle,
                        hintText: '  Name',
                        hintStyle: fontStyle2,
                        filled: true,
                        //enabled: true,
                        //fillColor: Colors.grey,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          size: 22.0,
                          color: color1,
                        )),
                    validator: RequiredValidator(errorText: 'Required')),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                    controller: email,
                    cursorColor: color2,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: color2),
                    decoration: InputDecoration(
                        hintText: "  Email ",
                        labelText: "Email",
                        hintStyle: fontStyle2,
                        //  labelStyle: TextStyle(color: color2,fontFamily: 'Roboto1'),
                        labelStyle: fontStyle,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: color1,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: 22.0,
                          color: color1,
                        )),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Required'),
                      EmailValidator(errorText: 'Not valid'),
                    ])),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButton(
                          dropdownColor: backgroundColorF,
                          isExpanded: true,
                          hint: Text(' Branch', style: fontStyle),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: color1,
                          ),
                          iconSize: 30,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                          elevation: 10,
                          value: branch,
                          onChanged: (newValue) {
                            setState(() {
                              branch = newValue;
                            });
                          },
                          items: listItem.map((valueItem) {
                            return DropdownMenuItem(
                                value: valueItem, child: Text(valueItem));
                          }).toList(),
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: DropdownButton(
                          dropdownColor: backgroundColorF,
                          isExpanded: true,
                          hint: Text('Category', style: fontStyle),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: color1,
                          ),
                          iconSize: 35,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                          elevation: 10,
                          value: role,
                          onChanged: (newValue) {
                            setState(() {
                              role = newValue;
                            });
                          },
                          items: typeList.map((valueItem) {
                            return DropdownMenuItem(
                                value: valueItem, child: Text(valueItem));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: rollNo,
                  cursorColor: color2,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: color2),
                  decoration: InputDecoration(
                      hintText: "   Enrollment No.",
                      labelText: "Enroll no.",
                      labelStyle: fontStyle,
                      hintStyle: fontStyle2,
                      // labelStyle: TextStyle(color: color2),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      prefixIcon: Icon(
                        Icons.call_sharp,
                        size: 22.0,
                        color: color1,
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Required';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  cursorColor: color2,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: color2),
                  decoration: InputDecoration(
                      hintText: "  Password",
                      labelText: "Password",
                      hintStyle: fontStyle2,
                      //  labelStyle: TextStyle(color: color2),
                      labelStyle: fontStyle,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      prefixIcon: Icon(
                        Icons.lock_open_sharp,
                        size: 22.0,
                        color: color1,
                      )),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Required'),
                    MinLengthValidator(6, errorText: 'More then six char')
                  ]),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: coPassword,
                  obscureText: false,
                  cursorColor: color2,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: color2),
                  decoration: InputDecoration(
                      hintText: "  Confirm Password",
                      labelText: " Confirm Password",
                      hintStyle: fontStyle2,
                      //labelStyle: TextStyle(color: color2),
                      labelStyle: fontStyle,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      prefixIcon: Icon(
                        Icons.phone_locked_sharp,
                        size: 22.0,
                        color: color1,
                      )),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Required'),
                    MinLengthValidator(6, errorText: 'More then six char')
                  ]),
                ),
                SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                    onPressed: _handleRegister,
                    // name: fullName.text,
                    // email: email.text,
                    // password: password.text,
                    // roll: rollNo.text,
                    // role: role.toString(),
                    // coPassword: confirmPassword.text,
                    // br: branch.toString()),

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      side: BorderSide(
                          color: color1, style: BorderStyle.solid, width: 3.0),
                      primary: Colors.black,
                      // shadowColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text(
                      'REGISTER',
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
      ),
    );
  }
}
