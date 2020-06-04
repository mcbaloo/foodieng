import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/Home_Video/index.dart';

class HomeVideoScreen extends StatefulWidget {
  const HomeVideoScreen({
    Key key,
    @required HomeVideoBloc homeVideoBloc,
  })  : _homeVideoBloc = homeVideoBloc,
        super(key: key);

  final HomeVideoBloc _homeVideoBloc;

  @override
  HomeVideoScreenState createState() {
    return HomeVideoScreenState();
  }
}

class HomeVideoScreenState extends State<HomeVideoScreen> {
  HomeVideoScreenState();

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
    //   return BlocBuilder<HomeVideoBloc, HomeVideoState>(
    //       bloc: widget._homeVideoBloc,
    //       builder: (
    //         BuildContext context,
    //         HomeVideoState currentState,
    //       ) {
    //         if (currentState is UnHomeVideoState) {
    //           return Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         }
    //         if (currentState is ErrorHomeVideoState) {
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
    //          if (currentState is InHomeVideoState) {
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
    //   widget._homeVideoBloc.add(LoadHomeVideoEvent());
    // }
  }
}
