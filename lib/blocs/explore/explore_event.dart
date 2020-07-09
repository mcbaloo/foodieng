import 'dart:async';
import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:foodieng/blocs/explore/index.dart';

abstract class ExploreEvent extends Equatable {
  List<Object> get props => [];
  const ExploreEvent();
}

class CommentClicked extends ExploreEvent {
  final String commentId;
  CommentClicked({@required this.commentId});
  @override
  String toString() => 'CommentClicked';
}

class Fetch extends ExploreEvent {
  @override
  String toString() => 'Fetch';
}

class UnCommentEvent extends ExploreEvent {
  // @override
  // Stream<CommentState> applyAsync({CommentState currentState, CommentBloc bloc}) async* {
  //   yield UnCommentState();
  // }
}

class LoadCommentEvent extends ExploreEvent {
  final String commentId;
  LoadCommentEvent({@required this.commentId});
  @override
  String toString() => 'LoadCommentEvent';
}

class GetExploreSearch extends ExploreEvent {
  final String type;
  GetExploreSearch({@required this.type});
  @override
  String toString() => 'GetExploreSearch $type';
}

class BottomSheetClosed extends ExploreEvent {}
