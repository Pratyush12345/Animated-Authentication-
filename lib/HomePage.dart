import 'package:UiDesign/testing3.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: Center(
        child: RaisedButton(
          onPressed:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Testing3()));
          },
          child: Text('Take me to Login Page'),
           )),

      );
  }
}