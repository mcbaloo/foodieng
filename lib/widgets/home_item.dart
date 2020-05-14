import 'package:flutter/material.dart';

Widget rowActivities(IconData icon, String text, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Icon(
        icon,
        //color: Colors.blue,
        size: 15.0,
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        text,
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 10),
      ),
    ],
  );
}

padwidget(int size, BuildContext context) {
  return MediaQuery.of(context).size.width / size;
}
