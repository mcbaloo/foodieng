import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:foodieng/models/user_response.dart';

abstract class AppbarState extends Equatable {
  final List propss;
  AppbarState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

class IsGuest extends AppbarState {}

class ISLoggedIn extends AppbarState {
  final UserResponse user;
  ISLoggedIn({@required this.user});
  @override
  List<Object> get props => [user];
  @override
  String toString() => 'UserResponse { user: $user }';
}

class AppStarted extends AppbarState {}
