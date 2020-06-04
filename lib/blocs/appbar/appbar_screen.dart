import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/appbar/index.dart';

class AppbarScreen extends StatefulWidget {
  const AppbarScreen({
    Key key,
    @required AppbarBloc appbarBloc,
  })  : _appbarBloc = appbarBloc,
        super(key: key);

  final AppbarBloc _appbarBloc;

  @override
  AppbarScreenState createState() {
    return AppbarScreenState();
  }
}

class AppbarScreenState extends State<AppbarScreen> {
  AppbarScreenState();

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
  Widget build(BuildContext context) {}
}
