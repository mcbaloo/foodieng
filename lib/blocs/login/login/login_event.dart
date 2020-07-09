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

class FirstNameChanged extends LoginEvent {
  final String text;
  FirstNameChanged({@required this.text});
  @override
  List<Object> get props => [this.text];
  @override
  String toString() => 'FirstNameChanged {textt : $text}';
}

class LastNameChanged extends LoginEvent {
  final String text;
  LastNameChanged({@required this.text});
  @override
  List<Object> get props => [this.text];
  @override
  String toString() => 'LastNameChanged {textt : $text}';
}

class EmailChanged extends LoginEvent {
  final String text;
  const EmailChanged({@required this.text});
  @override
  List<Object> get props => [this.text];
  @override
  String toString() => 'UsernameChanged {textt : $text}';
}

class ConfirmPasswordChanged extends LoginEvent {
  final String text;
  final String password;
  const ConfirmPasswordChanged({@required this.text, @required this.password});
  @override
  List<Object> get props => [this.text];
  @override
  String toString() => 'ConfirmPasswordChanged {textt : $text}';
}

class PasswordChanged extends LoginEvent {
  final String text;
  const PasswordChanged({@required this.text});
  @override
  List<Object> get props => [this.text];
  @override
  String toString() => 'PasswordChanged {textt : $text}';
}

class RegisterPasswordChanged extends LoginEvent {
  final String text;
  const RegisterPasswordChanged({@required this.text});
  @override
  List<Object> get props => [this.text];
  @override
  String toString() => 'RegisterPasswordChanged {textt : $text}';
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

class RegisterButtonPressed extends LoginEvent {
  final RegisterUser user;
  RegisterButtonPressed({@required this.user});
  @override
  List<Object> get props => [this.user];
}
