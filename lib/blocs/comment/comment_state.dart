import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodieng/blocs/comment/index.dart';
import 'package:foodieng/models/comment.dart';

abstract class CommentState extends Equatable {
  final List propss;
  CommentState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class OnCommentState extends CommentState {
  OnCommentState();

  @override
  String toString() => 'OnCommentState';
}

class CommentInitialized extends CommentState {
  CommentInitialized();

  @override
  String toString() => 'CommentInitialized';
}

/// Initialized
class InCommentState extends CommentState {
  final CommentModel comments;
  InCommentState({@required this.comments});
  InCommentState copyWith({CommentModel comments, bool isValid}) {
    return InCommentState(comments: comments ?? this.comments);
  }

  @override
  String toString() => 'InCommentState $comments';
}

class CommentTextValid extends CommentState {}

class CommentTextError extends CommentState {
  final String errorMessage;

  CommentTextError(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'CommentTextError';
}

class ErrorCommentState extends CommentState {
  final String errorMessage;

  ErrorCommentState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorCommentState';
}

class InCommentSubmit extends CommentState {
  @override
  String toString() => 'InCommentSubmit';
}
