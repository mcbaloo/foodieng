import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable {
  ///final List propss;
  final bool isEmailValid;
  final bool isConfirmPassword;
  final bool isPasswordValid;
  final bool isFirstNameValid;
  final bool isLastNameValid;
  // bool get isForValidToSumbit =>
  //     // isEmailValid &&
  //     //     isConfirmPassword &&
  //     //     isPasswordValid &&
  //     (isFirstNameValid && isLastNameValid) ?? false;
  LoginState(
      {@required this.isEmailValid,
      @required this.isConfirmPassword,
      @required this.isPasswordValid,
      @required this.isFirstNameValid,
      @required this.isLastNameValid});
  @override
  List<Object> get props => [
        isEmailValid,
        isConfirmPassword,
        isPasswordValid,
        isFirstNameValid,
        isLastNameValid
      ];
  LoginState copyWith(
      {bool isEmailValid,
      bool isConfirmPassword,
      bool isPasswordValid,
      bool isFirstNameValid,
      bool isLastNameValid}) {
    return LoginState(
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isConfirmPassword: isConfirmPassword ?? this.isConfirmPassword,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isFirstNameValid: isFirstNameValid ?? this.isFirstNameValid,
        isLastNameValid: isLastNameValid ?? this.isLastNameValid);
  }
}

/// UnInitialized
class LoginInitial extends LoginState {}

/// Initialized
class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class RegisterSuccess extends LoginState {}

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

class FirstNameError extends LoginState {
  final String errorMessage;

  FirstNameError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'FirstNameError { error: $errorMessage }';
}

class LastNameError extends LoginState {
  final String errorMessage;

  LastNameError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'LastNameError { error: $errorMessage }';
}

class PasswordError extends LoginState {
  final String errorMessage;

  PasswordError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'PasswordError { error: $errorMessage }';
}

class RegisterPasswordError extends LoginState {
  final String errorMessage;

  RegisterPasswordError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'RegisterPasswordError { error: $errorMessage }';
}

class ConfirmPasswordError extends LoginState {
  final String errorMessage;

  ConfirmPasswordError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'ConfirmPasswordError { error: $errorMessage }';
}
