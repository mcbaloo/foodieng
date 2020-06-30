import 'package:equatable/equatable.dart';

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
