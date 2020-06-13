import 'package:flutter/material.dart';
import 'package:foodieng/blocs/explore/index.dart';

class ExplorePage extends StatefulWidget {
  static const String routeName = '/explore';

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final _exploreBloc = ExploreBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: ExploreScreen(exploreBloc: _exploreBloc),
    );
  }
}
