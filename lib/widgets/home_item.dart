import 'package:flutter/material.dart';

Widget rowActivities(IconData icon, String text, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(2.0, 2, 8, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(
          icon,
          //color: Colors.blue,
          size: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12),
        ),
      ],
    ),
  );
}

padwidget(int size, BuildContext context) {
  return MediaQuery.of(context).size.width / size;
}
