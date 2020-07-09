import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodieng/blocs/Home_Video/Home_Video_state.dart';
import 'package:foodieng/screens/home.dart';
import 'package:foodieng/utils/fadein.dart';
import 'package:foodieng/utils/login_util.dart';
import 'package:foodieng/widgets/homevideo.dart';
import 'package:foodieng/widgets/loading.dart';
//import 'package:medng/screens/epidermic.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationControllerScreen;
  UserRepository repository = UserRepository();
  bool isLogin;
  @override
  void initState() {
    super.initState();
    animationControllerScreen =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    animationControllerScreen.forward();
    repository.hasToken().then((value) => this.isLogin = value);
    Timer(
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context,
            FadeRoute(
                page: Home(
              isLogin: isLogin,
            ))));
  }

  void dispose() {
    animationControllerScreen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: AnimatedBuilder(
          builder: (BuildContext context, Widget child) {
            return Transform.translate(
                offset: Offset(0, animationControllerScreen.value * 25),
                child: Opacity(
                  opacity: animationControllerScreen.value,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              colorBlendMode: BlendMode.softLight,
                              image:
                                  AssetImage("assets/images/foodieng_logo.png"),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Do more with Food",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Gill Bold',
                                fontSize:
                                    MediaQuery.of(context).size.height / 25,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Finally a Platform for Food Lovers",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: 'Gill',
                                    fontSize:
                                        MediaQuery.of(context).size.width /
                                            25)),
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
                  ),
                ));
          },
          animation: animationControllerScreen,
        ));
  }
}
