import 'package:UiDesign/Authentication/Counter.dart';
import 'package:UiDesign/TypeSelection.dart';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPageBuild extends StatefulWidget {
  final AnimatorKey<Offset> animatorKey;
  final AnimatorKey<Offset> logoanimatorKey;
  final AnimatorKey<Offset> circleanimatorKey;
  FirstPageBuild({this.animatorKey, this.logoanimatorKey, this.circleanimatorKey});
  @override
  _FirstPageBuildState createState() => _FirstPageBuildState();
}

class _FirstPageBuildState extends State<FirstPageBuild> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return ListView(
      shrinkWrap: true,
       padding: EdgeInsets.fromLTRB(28.0, 0.0, 28.0, 0.0),
      key: UniqueKey(), children: [
      InkWell(
        onTap: () {
          // TODO
        },
        child: Container(
          padding: EdgeInsets.all(4.0),
          height: 50.0,
          width: 350.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Color(0xFF868A8F))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/logos/google_light.png',
                  package: 'flutter_signin_button',
                ),
              ),
              SizedBox(
                width: 40.0,
              ),
              Text('CONTINUE WITH GOOGLE',
              style: TextStyle(
                color: Color(0xFF868A8F)
              ),),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      InkWell(
        onTap: () {
          setState(() {
              TypeSelection.typeOfPage = "LoginPage";
              
              widget.animatorKey.refreshAnimation(
                tween: Tween<Offset>(begin: Offset(0, -0.11), end: Offset(0, -0.14)),
                curve: Curves.easeInSine
              );
              widget.logoanimatorKey.refreshAnimation(
                tween: Tween<Offset>(begin: Offset(0, -0.7), end: Offset(0, -0.8)),
                curve: Curves.easeInSine,
                duration: Duration(milliseconds: 400)
              );
            });
        },
        child: Container(
          padding: EdgeInsets.all(4.0),
          height: 50.0,
          width: 350.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Color(0xFFEF7334))),
          child: Center(
            child: Text("I'LL USE MY EMAIL",
                      style: TextStyle(
                        color: Color(0xFFEF7334)
                      ),
          )),
        ),
      ),
      SizedBox(
        height: 100.0,
      ),
      GestureDetector(
          onTap: () {
            setState(() {
              TypeSelection.typeOfPage = "SignUpPage";
              Provider.of<Counter>(context, listen: false).increment(TypeSelection.typeOfPage);
              widget.animatorKey.refreshAnimation(
                tween: Tween<Offset>(begin: Offset(0, 0.02), end: Offset(0, -0.03)),
                curve: Curves.easeInSine,
                duration: Duration(milliseconds: 500)
              );
              widget.circleanimatorKey.refreshAnimation(
                tween: Tween<Offset>(begin: Offset(-0.6, -0.20), end: Offset(-0.6, -0.25)),
                curve: Curves.easeInSine,
                duration: Duration(milliseconds: 500)
              );
              widget.logoanimatorKey.refreshAnimation(
                tween: Tween<Offset>(begin: Offset(0, -0.5), end: Offset(0, -0.6)),
                curve: Curves.easeInSine,
                duration: Duration(milliseconds: 500)
              );
            });
            
          },
          child: Center(
            child: RichText(
              text: TextSpan(
                  text: "Don't have an Account ? ",
                  style: TextStyle(color: Color(0xFF868A8F), fontSize: 16),
                  children: [
                    TextSpan(
                        text: 'Signup',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 16))
                  ]),
            ),
          ))
    ]);
  }
}
