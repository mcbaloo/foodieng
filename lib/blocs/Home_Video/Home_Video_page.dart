import 'package:flutter/material.dart';
import 'package:foodieng/blocs/Home_Video/index.dart';

class HomeVideoPage extends StatefulWidget {
  static const String routeName = '/homeVideo';

  @override
  _HomeVideoPageState createState() => _HomeVideoPageState();
}

class _HomeVideoPageState extends State<HomeVideoPage> {
  final _homeVideoBloc = HomeVideoBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeVideo'),
      ),
      body: HomeVideoScreen(homeVideoBloc: _homeVideoBloc),
    );
  }
}
