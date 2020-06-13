import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/explore/index.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({
    Key key,
    @required ExploreBloc exploreBloc,
  })  : _exploreBloc = exploreBloc,
        super(key: key);

  final ExploreBloc _exploreBloc;

  @override
  ExploreScreenState createState() {
    return ExploreScreenState();
  }
}

class ExploreScreenState extends State<ExploreScreen> {
  ExploreScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
        bloc: widget._exploreBloc,
        builder: (
          BuildContext context,
          ExploreState currentState,
        ) {
          if (currentState is UnExploreState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorExploreState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
          if (currentState is InExploreState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load() {
    //widget._exploreBloc.add(LoadExploreEvent());
  }
}
