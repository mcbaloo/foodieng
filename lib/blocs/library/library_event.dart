import 'dart:async';
import 'dart:developer' as developer;

import 'package:foodieng/blocs/library/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LibraryEvent {
  Stream<LibraryState> applyAsync(
      {LibraryState currentState, LibraryBloc bloc});
}

class InitialLibraryEvent extends LibraryEvent {
  @override
  Stream<LibraryState> applyAsync(
      {LibraryState currentState, LibraryBloc bloc}) async* {
    yield UnLibraryState();
  }
}

class LoadLibraryEvent extends LibraryEvent {
  @override
  Stream<LibraryState> applyAsync(
      {LibraryState currentState, LibraryBloc bloc}) async* {
    try {
      yield UnLibraryState();
      await Future.delayed(Duration(seconds: 1));
      yield InLibraryState();
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadLibraryEvent', error: _, stackTrace: stackTrace);
      yield ErrorLibraryState(_?.toString());
    }
  }
}
