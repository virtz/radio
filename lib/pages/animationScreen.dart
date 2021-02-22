

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:radio/pages/splashscreen.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}


class _AnimationScreenState extends State<AnimationScreen> {

   void initState() {
  onTap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF241e20),
      body:Center(
        child: Container(
          child:Lottie.asset('assets/lottie/9606-wave-loader.json',
          frameBuilder: (context,child,composition){
            return AnimatedOpacity(
              child: child,
              opacity: composition == null?0:1,
              duration: const Duration(seconds:5),
              curve: Curves.easeInOutBack,
            );
          }
          )
        ),
      )
    );
  }
    onTap(){
   Timer(Duration(seconds: 6), () {
   Navigator.of(context).pushReplacement(
            // MaterialPageRoute(builder: (BuildContext context) => SplashScreen()));
            PageRouteBuilder(pageBuilder: (context,animation,anotherAnimation){
                return SplashScreen();
            },
            transitionDuration: Duration(milliseconds:4000),
            transitionsBuilder: (context, animation ,anotherAnimation,child){
              animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
              return FadeTransition(opacity:animation ,child:child);
            }
            ));
});
  }
}