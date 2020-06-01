import 'dart:async';
import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:foodieng/blocs/auth/auth_bloc/index.dart';
import 'package:foodieng/models/User.dart';
import 'package:meta/meta.dart';

abstract class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthBlocEvent {}

class LoggedIn extends AuthBlocEvent {
  final User user;
  const LoggedIn(this.user);
  @override
  List<Object> get props => [user];
  @override
  String toString() => 'LoggedIn {user : $user.username.toString()}';
}

class LoggedOut extends AuthBlocEvent {}
