
import 'package:UiDesign/Authentication/Alertmessage.dart';
import 'package:UiDesign/Authentication/Auth.dart';
import 'package:UiDesign/Authentication/Display.dart';
import 'package:UiDesign/Authentication/Wait.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Wrapper2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Auth.instance.testing(),
      builder:(context, snapshot){
        if(snapshot.connectionState==ConnectionState.done){
          if(snapshot.hasData){
          User user = snapshot.data;
          if(user.emailVerified)
          return Display();
          else
          return AlertMessage();
          }
          return Wait();
        }
        else{
          return Wait();
        }
      } 
    
    );
  }
}