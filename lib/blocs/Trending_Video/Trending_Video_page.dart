import 'package:flutter/material.dart';
import 'package:foodieng/blocs/Trending_Video/index.dart';

class TrendingVideoPage extends StatefulWidget {
  static const String routeName = '/trendingVideo';

  @override
  _TrendingVideoPageState createState() => _TrendingVideoPageState();
}

class _TrendingVideoPageState extends State<TrendingVideoPage> {
  final _trendingVideoBloc = TrendingVideoBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TrendingVideo'),
      ),
      body: TrendingVideoScreen(trendingVideoBloc: _trendingVideoBloc),
    );
  }
}
