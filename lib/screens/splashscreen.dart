import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodieng/screens/home.dart';
import 'package:foodieng/utils/fadein.dart';
import 'package:foodieng/widgets/homevideo.dart';
import 'package:foodieng/widgets/loading.dart';
//import 'package:medng/screens/epidermic.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacement(context, FadeRoute(page: Home())));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    colorBlendMode: BlendMode.softLight,
                    image: AssetImage("assets/images/foodieng_logo.png"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Do more with Food",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Rubik',
                      fontSize: MediaQuery.of(context).size.height / 25,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Finally a Platform for Food Lovers",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.width / 25)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Center(child: LoadingWidget()),
                ],
              ),
            ],
          ),
        ));
  }
}
