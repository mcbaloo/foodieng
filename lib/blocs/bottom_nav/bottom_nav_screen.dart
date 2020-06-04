import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/bottom_nav/index.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({
    Key key,
    @required BottomNavBloc bottomNavBloc,
  })  : _bottomNavBloc = bottomNavBloc,
        super(key: key);

  final BottomNavBloc _bottomNavBloc;

  @override
  BottomNavScreenState createState() {
    return BottomNavScreenState();
  }
}

class BottomNavScreenState extends State<BottomNavScreen> {
  BottomNavScreenState();

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
    // return BlocBuilder<BottomNavBloc, BottomNavState>(
    //     bloc: widget._bottomNavBloc,
    //     builder: (
    //       BuildContext context,
    //       BottomNavState currentState,
    //     ) {
    //       if (currentState is UnBottomNavState) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       if (currentState is ErrorBottomNavState) {
    //         return Center(
    //             child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Text(currentState.errorMessage ?? 'Error'),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 32.0),
    //               child: RaisedButton(
    //                 color: Colors.blue,
    //                 child: Text('reload'),
    //                 onPressed: _load,
    //               ),
    //             ),
    //           ],
    //         ));
    //       }
    //        if (currentState is InBottomNavState) {
    //         return Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Text(currentState.hello),
    //             ],
    //           ),
    //         );
    //       }
    //       return Center(
    //           child: CircularProgressIndicator(),
    //       );

    //     });
  }

  // void _load() {
  //   widget._bottomNavBloc.add(LoadBottomNavEvent());
  // }
}
