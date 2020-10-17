import 'package:UiDesign/Authentication/AuthError.dart';
import 'package:UiDesign/Authentication/Counter.dart';
import 'package:UiDesign/FirstPageBuild.dart';
import 'package:UiDesign/LoginPageBuild.dart';
import 'package:UiDesign/SignUpBuild.dart';
import 'package:UiDesign/TypeSelection.dart';

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Testing3 extends StatefulWidget {
  @override
  _Testing3State createState() => _Testing3State();
}

class _Testing3State extends State<Testing3> {
  final animatorkey = AnimatorKey<Offset>();
  final logoanimatorKey = AnimatorKey<Offset>();
  final circleanimatorKey = AnimatorKey<Offset>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animatorkey.triggerAnimation();
      circleanimatorKey.triggerAnimation();
    });
   
    TypeSelection.typeOfPage = "FirstPage";
    super.initState();
  }

  Widget build(BuildContext context) {
     print(TypeSelection.typeOfPage);
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Animator<Offset>(
            tween: Tween<Offset>(begin: Offset(1, 1.2), end: Offset(0.7, 1.2)),
            cycles: 1,
            builder: (context, animatorState, child) => FractionalTranslation(
              translation: animatorState.value,
              child: Container(
                height: 300.0,
                width: 400.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150.0),
                    color: Color(0xffffe6cc).withOpacity(0.4).withGreen(220)),
              ),
            ),
          ),
          Column(
            children: [
              Consumer<Counter>(
                  builder: (context,counter,child)=>Expanded(
                  flex: counter.flexofCircle,
                  child: Animator<Offset>(
                    animatorKey: circleanimatorKey,
                    tween: Tween<Offset>(begin: Offset(-1, -0.4), end: Offset(-0.6, -0.3)),
                    cycles: 1,
                    builder: (context, animatorState, child) =>
                        FractionalTranslation(
                      translation: animatorState.value,
                      child: Container(
                        height: 400.0,
                        width: 400.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(180.0),
                            color: Color(0xFFE6E7E8)),
                      ),
                    ),
                  ),
                ),
              ),
              Consumer<Counter>(
                  builder: (context, counter,child)=>Expanded(
                  flex: counter.flexofLogo,
                  child: Animator(
                        animatorKey: logoanimatorKey,
                        cycles: 1,
                        tween: Tween<Offset>(begin: Offset(0, -0.7), end: Offset(0, -0.9)) ,
                        duration: Duration(seconds: 1),
                        builder:(context, animatorState, child)=> FractionalTranslation(
                        translation: animatorState.value, 
                        child: Container(
                          height:250.0 ,
                          width: 250.0,
                          child: Image(
                              key: UniqueKey(),
                              width: 250.0,
                              height: 250.0,
                              image: AssetImage('assets/splash.png')),
                        )),
                  ),
                ),
              ),
              Consumer<Counter>(

                  builder: (context, counter,child)=>Expanded(
                  flex: counter.flexofFields,
                  child: Animator<Offset>(
                    animatorKey: animatorkey,
                    tween:
                        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0.2)),
                    cycles: 1,
                    builder: (context, animatorState, child) {
                     
                        return FractionalTranslation(
                            translation:  animatorState.value,
                            child: TypeSelection.typeOfPage == "FirstPage"
                                ? FirstPageBuild(
                                    animatorKey: animatorkey,
                                    logoanimatorKey: logoanimatorKey,
                                    circleanimatorKey: circleanimatorKey 
                                  )
                                : TypeSelection.typeOfPage == "LoginPage"
                                    ? ChangeNotifierProvider(
                                        create: (context)=>AuthError(),
                                        child: LoginPageBuild(
                                        animatorKey: animatorkey,
                                        logoanimatorKey: logoanimatorKey,
                                        circleanimatorKey: circleanimatorKey
                                      ),
                                    )
                                    : ChangeNotifierProvider(
                                        create: (context)=>AuthError(),
                                        child: SignUpBuild(
                                        animatorKey: animatorkey,logoanimatorKey: logoanimatorKey,
                                        circleanimatorKey: circleanimatorKey),
                                    ));},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
