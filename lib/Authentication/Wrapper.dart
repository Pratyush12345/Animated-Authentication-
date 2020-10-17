import 'package:UiDesign/Authentication/Counter.dart';
import 'package:UiDesign/Authentication/User.dart';
import 'package:UiDesign/Authentication/Wrapper2.dart';
import 'package:UiDesign/testing3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget{
  
  
  @override
  Widget build(BuildContext context){
  final user= Provider.of<AppUser>(context);
 
  if(user==null){

   return ChangeNotifierProvider(
     create: (context)=>Counter(),
     child: Testing3());
  } 
  else{
  return Wrapper2();
  }

}
}