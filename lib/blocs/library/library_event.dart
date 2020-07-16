import 'dart:async';
import 'dart:developer' as developer;

import 'package:foodieng/blocs/library/index.dart';
import 'package:foodieng/models/upload.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LibraryEvent {}

class InitialLibraryEvent extends LibraryEvent {}

class LoadLibraryEvent extends LibraryEvent {}

class LoadRecent extends LibraryEvent {
  @override
  String toString() => 'LoadRecent';
}

class LogOut extends LibraryEvent {}

class CreateContent extends LibraryEvent {
  final Upload content;
  CreateContent({@required this.content});
  @override
  String toString() => 'CreateContent';
}

class LoadUserContent extends LibraryEvent {
  final String userId;
  LoadUserContent({@required this.userId});
}

class DeleteUserContent extends LibraryEvent {
  final String userId;
  final String contentId;
  DeleteUserContent({@required this.userId, @required this.contentId});
}
