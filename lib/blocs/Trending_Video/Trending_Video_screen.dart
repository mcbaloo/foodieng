import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/Trending_Video/index.dart';

class TrendingVideoScreen extends StatefulWidget {
  const TrendingVideoScreen({
    Key key,
    @required TrendingVideoBloc trendingVideoBloc,
  })  : _trendingVideoBloc = trendingVideoBloc,
        super(key: key);

  final TrendingVideoBloc _trendingVideoBloc;

  @override
  TrendingVideoScreenState createState() {
    return TrendingVideoScreenState();
  }
}

class TrendingVideoScreenState extends State<TrendingVideoScreen> {
  TrendingVideoScreenState();

  @override
  void initState() {
    super.initState();
    //_load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //   return BlocBuilder<TrendingVideoBloc, TrendingVideoState>(
    //       bloc: widget._trendingVideoBloc,
    //       builder: (
    //         BuildContext context,
    //         TrendingVideoState currentState,
    //       ) {
    //         if (currentState is UnTrendingVideoState) {
    //           return Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         }
    //         if (currentState is ErrorTrendingVideoState) {
    //           return Center(
    //               child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Text(currentState.errorMessage ?? 'Error'),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 32.0),
    //                 child: RaisedButton(
    //                   color: Colors.blue,
    //                   child: Text('reload'),
    //                   onPressed: _load,
    //                 ),
    //               ),
    //             ],
    //           ));
    //         }
    //          if (currentState is InTrendingVideoState) {
    //           return Center(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 Text(currentState.hello),
    //               ],
    //             ),
    //           );
    //         }
    //         return Center(
    //             child: CircularProgressIndicator(),
    //         );

    //       });
    // }

    // void _load() {
    //   widget._trendingVideoBloc.add(LoadTrendingVideoEvent());
    // }
  }
}
