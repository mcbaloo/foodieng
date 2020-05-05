import 'package:flutter/material.dart';
import 'package:foodieng/screens/register.dart';
import 'package:foodieng/screens/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodieng',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xff606060), accentColor: Color(0xff2662F0)),
      //home: SplashScreen(),
      home: Register(),
    );
  }
}
