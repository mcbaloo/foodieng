import 'package:flutter/material.dart';
import 'package:foodieng/blocs/bottom_nav/index.dart';

class BottomNavPage extends StatefulWidget {
  static const String routeName = '/bottomNav';

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  final _bottomNavBloc = BottomNavBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNav'),
      ),
      body: BottomNavScreen(bottomNavBloc: _bottomNavBloc),
    );
  }
}
