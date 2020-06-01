import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/auth/auth_bloc/index.dart';
import 'package:foodieng/utils/login_util.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final UserRepository repository;

  AuthBlocBloc(this.repository);
  @override
  AuthBlocState get initialState => UnAuthBlocState();
  @override
  Stream<AuthBlocState> mapEventToState(
    AuthBlocEvent event,
  ) async* {
    try {
      if (event is AppStarted) {
        final bool hasToken = await repository.hasToken();
        if (hasToken) {
          yield AuthAuthenticated();
        } else {
          yield AuthUnAuthenticated();
        }
      }

      if (event is LoggedIn) {
        yield AuthLoading();
        await repository.persitUser(event.user);
      }

      if (event is LoggedOut) {
        yield AuthLoading();
        await repository.deleteToken();
        yield AuthUnAuthenticated();
      }
      //yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'AuthBlocBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
