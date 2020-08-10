import 'dart:async';

import 'package:flutter/material.dart';
import 'package:radio/pages/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  onTap();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Home()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
            image: DecorationImage(
                image: AssetImage('assets/images/launcher.png'))),
      ),
    );
  }
  onTap(){
   Timer(Duration(seconds: 3), () {
   Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Home()));
});
  }
}
