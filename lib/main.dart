import 'package:flutter/material.dart';
import 'package:radio/pages/animationScreen.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AfriStar Radio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        primarySwatch: Colors.blueGrey,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimationScreen(),
    );
  }
}


