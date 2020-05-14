import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget guestBottom(BuildContext context) => (BottomNavigationBar(
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
            FontAwesomeIcons.fire,
            size: 30.0,
            color: Color(0xff414D55),
          ),
          title: Text("Trending", style: TextStyle(color: Color(0xFFB4C1C4))),
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
