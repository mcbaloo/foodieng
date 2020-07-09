import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:foodieng/blocs/library/index.dart';
import 'package:foodieng/models/user_response.dart';
import 'package:foodieng/models/videos.dart';

abstract class LibraryState extends Equatable {
  final List propss;
  LibraryState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnLibraryState extends LibraryState {
  UnLibraryState();

  @override
  String toString() => 'UnLibraryState';
}

/// Initialized
class InLibraryState extends LibraryState {
  final VideoModel video;
  final UserResponse user;
  InLibraryState({@required this.video, @required this.user});
  @override
  String toString() => 'InLibraryState';
}

class LibraryGuest extends LibraryState {
  @override
  String toString() => 'LibraryGuest Loaded';
}

class ErrorLibraryState extends LibraryState {
  final String errorMessage;

  ErrorLibraryState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorLibraryState';
}

class Relogin extends LibraryState {}

class ShowDialog extends LibraryState {}

class LibraryLoading extends LibraryState {}

class LibraryError extends LibraryState {
  final String errorMessage;
  LibraryError({@required this.errorMessage});
  @override
  String toString() => 'LibraryError';
}

class UserContent extends LibraryState {
  final VideoModel videos;
  UserContent({@required this.videos});
}
