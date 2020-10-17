import 'package:UiDesign/TypeSelection.dart';
import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier{
  int flexofCircle =6;
  int flexofLogo =3;
  int flexofFields = 7;
  String page = "FirstPage";
  void increment(String key){
    if(key=="FirstPage"){
    flexofCircle = 6;
    flexofLogo = 3;
    flexofFields = 7;
    page = "FirstPage";
    }
    else if(key=="LoginPage"){
    flexofCircle = 5;
    flexofLogo = 3;
    flexofFields = 7;
    page = "LoginPage";
    }
    else if(key == "SignUpPage"){
    flexofCircle = 3;
    flexofLogo = 2;
    flexofFields = 7;
    page = "SignUpPage";
    }
    notifyListeners();
  }
}

