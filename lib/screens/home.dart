import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/models/videos.dart';
import 'package:foodieng/screens/account.dart';
import 'package:foodieng/screens/trending.dart';
import 'package:foodieng/utils/fadein.dart';
import 'package:foodieng/utils/vidoesutil.dart';
import 'package:foodieng/widgets/appbar.dart';
import 'package:foodieng/widgets/homevideo.dart';
import 'dart:async';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).accentColor,
        appBar: designBar(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: IndexedStack(
            children: <Widget>[
              HomeVideo(),
              Trending(),
            ],
            index: _currentIndex,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          //fixedColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home,
                  size: 20.0,
                  color: _currentIndex == 0
                      ? Theme.of(context).primaryColor
                      : Color(0xFFB4C1C4)),
              title: Text("Home",
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(FontAwesomeIcons.fire,
                  size: 20.0,
                  color: _currentIndex == 1
                      ? Theme.of(context).primaryColor
                      : Color(0xFFB4C1C4)),
              title:
                  Text("Trending", style: TextStyle(color: Color(0xFFB4C1C4))),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.subscriptions,
                  size: 20.0,
                  color: _currentIndex == 2
                      ? Theme.of(context).primaryColor
                      : Color(0xFFB4C1C4)),
              title:
                  Text("Library", style: TextStyle(color: Color(0xFFB4C1C4))),
            )
          ],
        ));
  }
}
