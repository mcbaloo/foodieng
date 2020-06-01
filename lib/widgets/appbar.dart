import 'package:flutter/material.dart';
import 'package:foodieng/screens/account.dart';
import 'package:foodieng/utils/fadein.dart';

@override
Widget designBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: false,
    iconTheme: new IconThemeData(color: Theme.of(context).primaryColor),
    title: SizedBox(
      width: MediaQuery.of(context).size.width / 2.8,
      child: Image(
        image: AssetImage("assets/images/foodieng_logo.png"),
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () => {showSearch(context: context, delegate: null)},
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: IconButton(
            onPressed: () =>
                {Navigator.push(context, FadeRoute(page: Account()))},
            icon: Icon(Icons.account_circle),
          ))
    ],
    elevation: 2,
  );
}
