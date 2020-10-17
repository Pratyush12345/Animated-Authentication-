import 'package:UiDesign/Authentication/Auth.dart';
import 'package:UiDesign/Authentication/AuthError.dart';
import 'package:UiDesign/Authentication/Counter.dart';
import 'package:UiDesign/TypeSelection.dart';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPageBuild extends StatefulWidget {
  final AnimatorKey<Offset> animatorKey;
  final AnimatorKey<Offset> logoanimatorKey;
  final AnimatorKey<Offset> circleanimatorKey;
  LoginPageBuild(
      {this.animatorKey, this.logoanimatorKey, this.circleanimatorKey});
  @override
  _LoginPageBuildState createState() => _LoginPageBuildState();
}

class _LoginPageBuildState extends State<LoginPageBuild> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return ListView(
      padding: EdgeInsets.fromLTRB(28.0, 0.0, 28.0, 0.0),
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LOGIN",
          style: TextStyle(
              fontSize: 22.0,
              color: Color(0xFF868A8F),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.0,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Email cannot be empty";
                  }
                  if (!RegExp(
                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                      .hasMatch(value)) {
                    return 'Please enter a valid email Address';
                  }
                  return null;
                },
                style: TextStyle(
                  fontSize: 14.0,
                   color: Color(0xFF868A8F)
                ),
                onChanged: null,
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    hintText: "EMAIL",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: _passController,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Password cannot be empty";
                  }
                  return null;
                },
                style: TextStyle(
                  fontSize: 14.0,
                   color: Color(0xFF868A8F)
                ),
                onChanged: null,
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    hintText: "PASSWORD",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              SizedBox(
                height: 35.0,
              ),
              InkWell(
                onTap: () async{
                  final formstate = _formKey.currentState;
                  if(formstate.validate()){
                    formstate.save();
                   String result=await Auth.instance.signIn(_emailController.text.trim(), _passController.text.trim());
                   Provider.of<AuthError>(context, listen: false)
                        .errorOccured(result, TypeSelection.typeOfPage);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  height: _height * 0.05,
                  width: _width,
                  decoration: BoxDecoration(
                    color: Color(0xFFEF7334),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: Text(
                      "PROCEED",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.0,),
              Consumer<AuthError>(builder: (context, error, child) {
                return Text(
                  error.resultLogin,
                  style: TextStyle(fontSize: 12.0, color: Color(0xFF868A8F)),
                );
              }),
              SizedBox(
                height: 66.0,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      TypeSelection.typeOfPage = "SignUpPage";
                      Provider.of<Counter>(context, listen: false)
                          .increment(TypeSelection.typeOfPage);
                      widget.animatorKey.refreshAnimation(
                          tween: Tween<Offset>(
                              begin: Offset(0, 0.0), end: Offset(0, -0.03)),
                          curve: Curves.easeInSine,
                          duration: Duration(milliseconds: 500));
                      widget.circleanimatorKey.refreshAnimation(
                          tween: Tween<Offset>(
                              begin: Offset(-0.6, -0.25),
                              end: Offset(-0.6, -0.3)),
                          curve: Curves.easeInSine,
                          duration: Duration(milliseconds: 500));
                      widget.logoanimatorKey.refreshAnimation(
                          tween: Tween<Offset>(
                              begin: Offset(0, -0.5), end: Offset(0, -0.6)),
                          curve: Curves.easeInSine,
                          duration: Duration(milliseconds: 500));
                    });
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: "Don't have an Account ? ",
                          style:
                              TextStyle(color: Color(0xFF868A8F), fontSize: 16),
                          children: [
                            TextSpan(
                                text: 'Signup',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 16))
                          ]),
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
