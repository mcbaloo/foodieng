import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/library/index.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({
    Key key,
    @required LibraryBloc libraryBloc,
  })  : _libraryBloc = libraryBloc,
        super(key: key);

  final LibraryBloc _libraryBloc;

  @override
  LibraryScreenState createState() {
    return LibraryScreenState();
  }
}

class LibraryScreenState extends State<LibraryScreen> {
  LibraryScreenState();

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
    return BlocBuilder<LibraryBloc, LibraryState>(
        bloc: widget._libraryBloc,
        builder: (
          BuildContext context,
          LibraryState currentState,
        ) {
          if (currentState is UnLibraryState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorLibraryState) {
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
          if (currentState is InLibraryState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(""),
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
    widget._libraryBloc.add(LoadLibraryEvent());
  }
}
