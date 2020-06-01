import 'package:flutter/material.dart';
import 'package:foodieng/blocs/auth/auth_bloc/index.dart';

class AuthBlocPage extends StatefulWidget {
  static const String routeName = '/authBloc';

  @override
  _AuthBlocPageState createState() => _AuthBlocPageState();
}

class _AuthBlocPageState extends State<AuthBlocPage> {
  //final _authBlocBloc = AuthBlocBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AuthBloc'),
      ),
      //body: AuthBlocScreen(authBlocBloc: _authBlocBloc),
    );
  }
}
