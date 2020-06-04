import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  final List propss;
  LoginState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class LoginInitial extends LoginState {}

/// Initialized
class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => ' LoginFaliure { error: $errorMessage }';
}

class IsUsernameValid extends LoginState {}

class IsPasswordValid extends LoginState {}

class IsFormValid extends LoginState {}

class UsernameError extends LoginState {
  final String errorMessage;

  UsernameError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'UsernameError { error: $errorMessage }';
}

class PasswordError extends LoginState {
  final String errorMessage;

  PasswordError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'PasswordError { error: $errorMessage }';
}
