import 'package:UiDesign/Authentication/Auth.dart';
import 'package:UiDesign/Authentication/AuthError.dart';
import 'package:UiDesign/Authentication/Counter.dart';
import 'package:UiDesign/Authentication/User.dart';
import 'package:UiDesign/TypeSelection.dart';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpBuild extends StatefulWidget {
  final AnimatorKey<Offset> animatorKey;
  final AnimatorKey<Offset> logoanimatorKey;
  final AnimatorKey<Offset> circleanimatorKey;
  SignUpBuild({this.animatorKey, this.logoanimatorKey, this.circleanimatorKey});
  @override
  _SignUpBuildState createState() => _SignUpBuildState();
}

class _SignUpBuildState extends State<SignUpBuild> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();
  final TextEditingController _fstnameController = TextEditingController();
  final TextEditingController _lstnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    String result = "";
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.fromLTRB(28.0, 0.0, 28.0, 0.0),
      children: [
        Text(
          "SIGNUP",
          style: TextStyle(
              fontSize: 22.0, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 40.0,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50.0,
                    width: 170.0,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "First Name cannot be empty";
                        }
                        return null;
                      },
                      controller: _fstnameController,
                      style: TextStyle(
                        fontSize: 14.0,
                         color: Color(0xFF868A8F)
                        
                      ),
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    
                          hintText: "FIRST NAME",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    height: 50.0,
                    width: 170.0,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Last name cannot be empty";
                        }
                        return null;
                      },
                      controller: _lstnameController,
                      style: TextStyle(
                        fontSize: 14.0,
                         color: Color(0xFF868A8F)
                      ),
                      onChanged: null,
                      decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    
                          hintText: "LAST NAME",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              TextFormField(
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
                controller: _emailController,
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
                    hintText: "E-MAIL",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Password cannot be empty";
                  }
                  if(value.length<8){
                    return "Password must be 8 character long";
                  }
                  return null;
                },
                controller: _passController,
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
                height: 20.0,
              ),
              TextFormField(
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
                controller: _confirmpassController,
                onChanged: null,
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    hintText: "CONFIRM-PASSWORD",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              SizedBox(
                height: 35.0,
              ),
              InkWell(
                onTap: () async {
                  final formstate = _formKey.currentState;
                  if (formstate.validate()) {
                    if(_passController.text==_confirmpassController.text){
                    formstate.save();
                    print("Signup");
                    Auth.instance.pref
                        .setString("Email", _emailController.text.trim());
                    Auth.instance.pref.setString("Pass", _passController.text.trim());
                    result = await Auth.instance
                        .signUp(_emailController.text.trim(), _passController.text.trim(), 
                        _fstnameController.text.trim()+" "+ _lstnameController.text.trim());
                    Provider.of<AuthError>(context, listen: false)
                        .errorOccured(result, TypeSelection.typeOfPage);
                    }
                    else{
                    Provider.of<AuthError>(context, listen: false)
                        .errorOccured("Password unmatched", TypeSelection.typeOfPage);  
                    }    
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
              SizedBox(
                height: 4.0,
              ),
              Consumer<AuthError>(builder: (context, error, child) {
                return Text(
                  error.resultSignUp,
                  style: TextStyle(fontSize: 12.0, color: Color(0xFF868A8F)),
                );
              }),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      TypeSelection.typeOfPage = "FirstPage";
                      Provider.of<Counter>(context, listen: false)
                          .increment(TypeSelection.typeOfPage);
                      widget.animatorKey.refreshAnimation(
                          tween: Tween<Offset>(
                              begin: Offset(0, 0.1), end: Offset(0, 0.2)),
                          curve: Curves.fastOutSlowIn);
                      widget.circleanimatorKey.refreshAnimation(
                          tween: Tween<Offset>(
                              begin: Offset(-0.6, -0.4),
                              end: Offset(-0.6, -0.3)),
                          curve: Curves.easeInSine,
                          duration: Duration(milliseconds: 500));
                      widget.logoanimatorKey.refreshAnimation(
                          tween: Tween<Offset>(
                              begin: Offset(0, -0.8), end: Offset(0, -0.7)),
                          curve: Curves.easeInSine,
                          duration: Duration(milliseconds: 500));
                    });
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Already have an Account ? ',
                          style:
                              TextStyle(color: Color(0xFF868A8F), fontSize: 16),
                          children: [
                            TextSpan(
                                text: 'Login',
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
