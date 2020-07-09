import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/auth/auth_bloc/index.dart';
import 'package:foodieng/screens/account.dart';
import 'package:foodieng/screens/home.dart';
import 'package:foodieng/screens/login.dart';
import 'package:foodieng/screens/login_home.dart';
import 'package:foodieng/screens/register.dart';
import 'package:foodieng/screens/splashscreen.dart';
import 'package:foodieng/utils/login_util.dart';

void main() {
  final userRepository = UserRepository();
  runApp(BlocProvider<AuthBlocBloc>(
    create: (context) {
      return AuthBlocBloc(userRepository)..add(AppStarted());
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Foodieng',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            cursorColor: Color(0xff606060),
            cupertinoOverrideTheme: CupertinoThemeData(
              primaryColor: Colors.white,
            ),
            primaryColor: Color(0xff606060),
            accentColor: Colors.white),
        home:
            BlocBuilder<AuthBlocBloc, AuthBlocState>(builder: (context, state) {
          // Timer(Duration(seconds: 0), () {
          if (state is AuthUninitialized) {
            return SplashScreen();
          }
          if (state is AuthAuthenticated) {
            return SplashScreen();
          }
          if (state is AuthUnAuthenticated) {
            return SplashScreen();
          }
          if (state is AuthLoading) {
            return SplashScreen();
            // return build(context);
          }
          return SplashScreen();
          //return Login();
        }));
  }
}

Widget build(BuildContext context) => Center(
      child: CircularProgressIndicator(),
    );
