import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget bottomNav(BuildContext context) => (BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.home,
            size: 30.0,
            color: Theme.of(context).primaryColor,
          ),
          title: Text("Home",
              style: TextStyle(color: Theme.of(context).primaryColor)),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(
            FontAwesomeIcons.compass,
            size: 30.0,
            color: Color(0xff414D55),
          ),
          title: Text("Explore", style: TextStyle(color: Color(0xFFB4C1C4))),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.add_circle,
            size: 40.0,
            color: Color(0xff414D55),
          ),
          title: Text("Explore", style: TextStyle(color: Color(0xFFB4C1C4))),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: new Stack(children: <Widget>[
            new Icon(Icons.favorite, size: 30.0, color: Color(0xff414D55)),
            new Positioned(
              // top: -1.0,
              // right: -1.0,
              right: 0,
              child: new Container(
                padding: EdgeInsets.all(1),
                decoration: new BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: new Text(
                  '100',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ]),
          title: Text("Likes", style: TextStyle(color: Color(0xFFB4C1C4))),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.subscriptions,
            size: 30.0,
            color: Color(0xff414D55),
          ),
          title: Text("Library", style: TextStyle(color: Color(0xFFB4C1C4))),
        )
      ],
    ));
