import 'package:flutter/material.dart';
import 'package:foodieng/screens/account.dart';
import 'package:foodieng/screens/explore.dart';
import 'package:foodieng/screens/likes.dart';
import 'package:foodieng/screens/login_home.dart';
import 'package:foodieng/screens/splashscreen.dart';
import 'package:foodieng/screens/trending.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Foodieng',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xff606060), accentColor: Colors.white),
        //home: SplashScreen(),
        home: Likes());
  }
}
