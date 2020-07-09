import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/auth/auth_bloc/auth_bloc_bloc.dart';
import 'package:foodieng/blocs/login/login/index.dart';
import 'package:foodieng/screens/login.dart';
import 'package:foodieng/utils/login_util.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserRepository userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            //userRepository: userRepository,
            authenticationBloc: BlocProvider.of<AuthBlocBloc>(context),
          );
        },
        child: Login(),
      ),
    );
  }
}
