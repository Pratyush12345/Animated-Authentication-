
import 'package:UiDesign/Authentication/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

String name;
String email;
String imageUrl;

abstract class BaseAuth {
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String password, String name);
  Future<void> signOut();
}

class Auth implements BaseAuth {
  static Auth instance = Auth._();
  Auth._(){
    _sharedprefinit();
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User currentuser;
  SharedPreferences pref; 

  _sharedprefinit() async{
    pref = await  SharedPreferences.getInstance(); 
  }
  Future<User> testing()async{
    UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                     email: pref.getString("Email") , password: pref.getString("Pass"));
                  return  credential.user;                 
  }
  

  _userFromFirebaseuser(User user){
   return user!=null? AppUser(uid:user.uid, name: user.displayName, isEmailVerfied: user.emailVerified ):null;
  }
  Stream<AppUser> get appuser{
    
    return _firebaseAuth.authStateChanges().map((user) => _userFromFirebaseuser(user));
  }
  @override
  Future<String> signIn(String email, String password) async {
    try{
    UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    currentuser = credential.user;
    return "";
    }catch(e){
      print(e);
      return e.message;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  
  @override
  Future<String> signUp(String email, String password, String name) async {
    try{
    UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    currentuser = credential.user;
    await currentuser.updateProfile(displayName: name); 
    await currentuser.reload();
    }
    catch(e){
      print(e);
      return e.message;
    }
     try {
      await currentuser.sendEmailVerification();
      return "";
    } catch (e) {
      print("An error occured while trying to send email verification");
      print(e);
      return e.message;
    }         
  }
}
