import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/auth/auth_bloc/index.dart';

class AuthBlocScreen extends StatefulWidget {
  const AuthBlocScreen({
    Key key,
    @required AuthBlocBloc authBlocBloc,
  })  : _authBlocBloc = authBlocBloc,
        super(key: key);

  final AuthBlocBloc _authBlocBloc;

  @override
  AuthBlocScreenState createState() {
    return AuthBlocScreenState();
  }
}

class AuthBlocScreenState extends State<AuthBlocScreen> {
  AuthBlocScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBlocBloc, AuthBlocState>(
        bloc: widget._authBlocBloc,
        builder: (
          BuildContext context,
          AuthBlocState currentState,
        ) {
          if (currentState is UnAuthBlocState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorAuthBlocState) {
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
                      onPressed: null),
                ),
              ],
            ));
          }
          if (currentState is InAuthBlocState) {
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
}
