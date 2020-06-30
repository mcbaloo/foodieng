import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodieng/models/user_response.dart';
import 'package:foodieng/models/videos.dart';

abstract class ExploreState extends Equatable {
  final List propss;
  ExploreState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnExploreState extends ExploreState {
  UnExploreState();

  @override
  String toString() => 'UnExploreState';
}

/// Initialized
class InExploreState extends ExploreState {
  final VideoModel video;
  final UserResponse user;
  final String type;
  InExploreState(
      {@required this.video, @required this.user, @required this.type});

  @override
  String toString() => 'InExploreState $video';
}

class ErrorExploreState extends ExploreState {
  final String errorMessage;

  ErrorExploreState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorExploreState';
}

class CommentClick extends ExploreState {
  final String commnetId;
  CommentClick({@required this.commnetId});
  @override
  String toString() => 'CommentClick';
}
