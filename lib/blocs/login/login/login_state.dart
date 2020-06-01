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

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => ' LoginFaliure { error: $errorMessage }';
}
