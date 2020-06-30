import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CommentEvent extends Equatable {
  @override
  List<Object> get props => [];
  const CommentEvent();
}

class UnCommentEvent extends CommentEvent {}

class LoadCommentEvent extends CommentEvent {
  final String commentId;
  LoadCommentEvent({@required this.commentId});
  @override
  String toString() => 'LoadCommentEvent';
}

class AddComment extends CommentEvent {
  final String comment;
  final String contentId;
  AddComment({this.comment, this.contentId});
}

class CommentTextChange extends CommentEvent {
  final String text;
  CommentTextChange({@required this.text});
}
