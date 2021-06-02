import 'dart:ui';
import 'package:flutter/material.dart';

class General extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<General> {
  void changeSize() {}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              "Genral",
              style: TextStyle(color: Colors.white),
            )),
        elevation: 0.0,
        backgroundColor: Colors.cyan.withOpacity(0.5),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) =>  General()));
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.verified_user), onPressed: () {})
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1513343041531-f73bffeed81b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80'),
                fit: BoxFit.cover)),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 18,
                        spreadRadius: 18,
                        color: Colors.black.withOpacity(0.4))
                  ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 12,
                        sigmaY: 12,
                      ),
                      child: Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1.5, color: Colors.white.withOpacity(0.4))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 52,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/d/9/a/d9a1058910_50163142_elon-musk1.jpg'),
                                radius: 50,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.black.withOpacity(0.4),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            OutlinedButton.icon(
                              style: TextButton.styleFrom(
                                side:
                                BorderSide(color: Colors.cyan.withOpacity(0.7)),
                              ),
                              icon: Icon(
                                Icons.edit_rounded,
                                color: Colors.cyan.withOpacity(0.7),
                              ),
                              label: Text(
                                'Edit Profile',
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 18,
                        spreadRadius: 18,
                        color: Colors.black.withOpacity(0.4))
                  ]),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) =>  Password()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 12,
                          sigmaY: 12,
                        ),
                        child: Container(
                          width: 300,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  width: 1.5,
                                  color: Colors.white.withOpacity(0.4))),
                          child: Center(
                            child: GestureDetector(
                              onTap: null,
                              child: ListTile(
                                leading: Icon(
                                  Icons.edit_sharp,
                                  color: Colors.white,
                                ),
                                title: Text("Change Password ",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                trailing: Icon(
                                  Icons.rotate_right_sharp,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            )),
      ),
    );
  }
}
class Password extends StatefulWidget {
  const Password({Key key}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
              child: Text(
                "Password",
                style: TextStyle(color: Colors.white),
              )),
          elevation: 0.0,
          backgroundColor: Colors.cyan.withOpacity(0.5),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => General()));
            },
          ),
          actions: [
            IconButton(icon: Icon(Icons.verified_user), onPressed: () {})
          ],
        ),
        body:Container(
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 18,
                  spreadRadius: 18,
                  color: Colors.black.withOpacity(0.4))
            ]),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) =>  Password()));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 12,
                    sigmaY: 12,
                  ),
                  child: Center(
                    child: Container(
                      width: 330,
                      height: 470,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              width: 1.5,
                              color: Colors.white.withOpacity(0.4))),
                      child:Center(
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 52,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/d/9/a/d9a1058910_50163142_elon-musk1.jpg'),
                                    radius: 50,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, left: 14, right: 14),
                                  child: TextFormField(
                                    controller: _password,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white),
                                    obscureText: true,
                                    keyboardType: TextInputType.text,
                                    decoration:
                                    buildInputDecoration(Icons.lock, "Password"),
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Please a Enter Password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, left: 14, right: 14),
                                  child: TextFormField(
                                    cursorColor: Colors.white,
                                    obscureText: true,
                                    style: TextStyle(color: Colors.white),
                                    controller: _confirmPassword,
                                    keyboardType: TextInputType.text,
                                    decoration: buildInputDecoration(
                                      Icons.lock,
                                      "Confirm Password",
                                    ),
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Please re-enter password';
                                      }
                                      print(_password.text);
                                      print(_confirmPassword.text);
                                      if (_password.text != _confirmPassword.text) {
                                        return "Password does not match";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                ConstrainedBox(
                                  constraints:
                                  BoxConstraints.tightFor(width: 300, height: 60),

                                  child: ElevatedButton.icon(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.cyan.withOpacity(0.5),
                                        shadowColor: Colors.white,

                                        shape: StadiumBorder()),
                                    icon: Icon(Icons.enhanced_encryption_outlined),
                                    label: Text(
                                      'Set Password',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        print("successful");
                                        return;
                                      } else {
                                        print("Unsuccessful");
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),


                    ),
                  ),
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1513343041531-f73bffeed81b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80'),
                  fit: BoxFit.cover)),
        ),

      ),
    );

  }
}

InputDecoration buildInputDecoration(IconData icons,String hintText ) {
  return InputDecoration(
    hintText: hintText,hintStyle:TextStyle( color: Colors.white),




    prefixIcon: Icon(icons ,color: Colors.cyan,),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: BorderSide(
          color: Colors.cyan,
          width: 1.5
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: BorderSide(
        color: Colors.cyan,
        width: 1.5,
      ),
    ),
    enabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: BorderSide(
        color: Colors.cyan,
        width: 1.5,
      ),
    ),
  );
}
