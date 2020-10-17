import 'package:flutter/material.dart';


class AuthError extends ChangeNotifier{
  String resultLogin = "";
  String resultSignUp = "";
  void errorOccured(String error, String page){
    if(page=="LoginPage"){
    resultLogin = error;
    resultSignUp="";
    }
    else{
      resultSignUp = error;
      resultLogin = "";
    }
    notifyListeners();
  }
}