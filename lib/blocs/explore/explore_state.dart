import 'package:equatable/equatable.dart';

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
  final String hello;

  InExploreState(this.hello) : super([hello]);

  @override
  String toString() => 'InExploreState $hello';
}

class ErrorExploreState extends ExploreState {
  final String errorMessage;

  ErrorExploreState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorExploreState';
}

class CommentClick extends ExploreState {
  @override
  String toString() => 'CommentClick';
}
