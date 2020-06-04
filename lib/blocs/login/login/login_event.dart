import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/rendering.dart';
import 'package:foodieng/models/User.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
  const LoginEvent();
}

class UsernameChanged extends LoginEvent {
  final String text;
  const UsernameChanged({@required this.text});
  @override
  List<Object> get props => [this.text];
  @override
  String toString() => 'UsernameChanged {textt : $text}';
}

class PasswordChanged extends LoginEvent {
  final String text;
  const PasswordChanged({@required this.text});
  @override
  List<Object> get props => [this.text];
  @override
  String toString() => 'PasswordChanged {textt : $text}';
}

class LogginButtonPressed extends LoginEvent {
  final User user;
  const LogginButtonPressed({@required this.user});
  @override
  List<Object> get props => [this.user];
  @override
  String toString() =>
      'LoggedButtonPressed {username : $user.username.toString(), password: $user.password.toString()}';
}
