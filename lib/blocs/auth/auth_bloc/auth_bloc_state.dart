import 'package:equatable/equatable.dart';

abstract class AuthBlocState extends Equatable {
  final List propss;
  AuthBlocState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnAuthBlocState extends AuthBlocState {
  UnAuthBlocState();

  @override
  String toString() => 'UnAuthBlocState';
}

/// Initialized
class InAuthBlocState extends AuthBlocState {
  final String hello;

  InAuthBlocState(this.hello) : super([hello]);

  @override
  String toString() => 'InAuthBlocState $hello';
}

class ErrorAuthBlocState extends AuthBlocState {
  final String errorMessage;

  ErrorAuthBlocState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorAuthBlocState';
}

class AuthUninitialized extends AuthBlocState {}

class AuthAuthenticated extends AuthBlocState {}

class AuthLoading extends AuthBlocState {}

class AuthUnAuthenticated extends AuthBlocState {}
