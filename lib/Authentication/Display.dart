
import 'package:UiDesign/Authentication/Auth.dart';
import 'package:flutter/material.dart';
class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dispaly"),) ,
      body: Center(
       child: Column(
         children: [
           Text("Dispaly"),
           SizedBox(height: 10.0,),
           RaisedButton(onPressed: (){
             Auth.instance.signOut();
           },
           child: Text('Sign out'),
           )
         ],
       )
      ),
    );
  }
}