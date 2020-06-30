import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/library/index.dart';
import 'package:foodieng/utils/login_util.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  UserRepository repository = UserRepository();
  @override
  LibraryState get initialState => UnLibraryState();

  @override
  Stream<LibraryState> mapEventToState(
    LibraryEvent event,
  ) async* {
    try {
      if (event is InitialLibraryEvent) {
        bool isLoggedIn = await this.repository.hasToken();
        if (isLoggedIn) {
          yield InLibraryState();
        } else {
          yield LibraryGuest();
        }
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LibraryBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
