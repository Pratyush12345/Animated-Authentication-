import 'package:UiDesign/Authentication/Auth.dart';
import 'package:UiDesign/Authentication/Display.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlertMessage extends StatefulWidget {
  @override
  _AlertMessageState createState() => _AlertMessageState();
}

class _AlertMessageState extends State<AlertMessage> {
  @override
  void initState() {
    //_sharedprefinit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gurucool"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Color(0xFFEF7334))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(
                      height: 20.0,
                    ),
                    Text("Verify Your Account",
                     style: TextStyle(
                       color:  Color(0xFF868A8F) ,
                       fontSize: 26.0
                     ),),
                    SizedBox(
                      height: 80.0,
                    ), 
                    Text("Link to verify account has been sent to your email",
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.8),
                      fontSize: 18.0
                    ),),
                  ],
                )),
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    UserCredential credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: Auth.instance.pref.getString("Email"),
                            password: Auth.instance.pref.getString("Pass"));

                    User currentuser = credential.user;
                    if (currentuser.emailVerified) {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Display()));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Continue',
                            style: TextStyle(color: Colors.white, fontSize: 18.0)),
                        SizedBox(width: 30.0,),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFFEF7334),
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
                SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () async {
                UserCredential credential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: Auth.instance.pref.getString("Email"),
                        password: Auth.instance.pref.getString("Pass"));
                User currentuser = credential.user;
                currentuser.delete();
                Auth.instance.pref.remove("Email");
                Auth.instance.pref.remove("Pass");
              },
              child: Container(
                padding: EdgeInsets.all(4.0),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: Text('Use Alternative Email',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
                decoration: BoxDecoration(
                    color: Color(0xFFEF7334),
                    borderRadius: BorderRadius.circular(12.0)),
              ),
            )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
