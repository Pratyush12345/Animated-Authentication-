import 'package:flutter/material.dart';
class Wait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100.0,
          height: 100.0,
          child: CircularProgressIndicator()),
      ),
    );
  }
}