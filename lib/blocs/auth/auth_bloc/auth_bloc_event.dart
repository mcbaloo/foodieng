import 'package:equatable/equatable.dart';
import 'package:foodieng/models/user_response.dart';

abstract class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthBlocEvent {}

class LoggedIn extends AuthBlocEvent {
  final UserResponse user;
  const LoggedIn(this.user);
  @override
  List<Object> get props => [user];
  @override
  String toString() => 'LoggedIn {user : $user.username.toString()}';
}

class LoggedOut extends AuthBlocEvent {}
