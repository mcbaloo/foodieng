import 'package:flutter/material.dart';
import 'package:foodieng/blocs/library/index.dart';

class LibraryPage extends StatefulWidget {
  static const String routeName = '/library';

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final _libraryBloc = LibraryBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
      ),
      body: LibraryScreen(libraryBloc: _libraryBloc),
    );
  }
}
