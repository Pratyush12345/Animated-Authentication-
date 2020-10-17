import 'package:UiDesign/Authentication/Auth.dart';
import 'package:UiDesign/Authentication/Counter.dart';
import 'package:UiDesign/Authentication/User.dart';
import 'package:UiDesign/Authentication/Wrapper.dart';
import 'package:UiDesign/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
        
        value:Auth.instance.appuser,
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch:  MaterialColor(
          0xffF36C24,
          <int, Color>{
            50: Color(0xFFFBE9E7),
            100: Color(0xFFFFCCBC),
            200: Color(0xFFFFAB91),
            300: Color(0xFFFF8A65),
            400: Color(0xFFFF7043),
            500: Color(0xffF36C24),
            600: Color(0xFFF4511E),
            700: Color(0xFFE64A19),
            800: Color(0xFFD84315),
            900: Color(0xFFBF360C),
          },
        ),
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}

