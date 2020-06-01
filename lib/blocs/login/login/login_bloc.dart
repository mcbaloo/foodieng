import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/auth/auth_bloc/auth_bloc_bloc.dart';
import 'package:foodieng/blocs/auth/auth_bloc/auth_bloc_event.dart';
import 'package:foodieng/blocs/login/login/index.dart';
import 'package:foodieng/utils/login_util.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthBlocBloc authenticationBloc;

  LoginBloc({this.userRepository, this.authenticationBloc});
  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LogginButtonPressed) {
      yield LoginInitial();
      try {
        final user = await userRepository.validateUser(event.user);
        authenticationBloc.add(LoggedIn(user));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error.toString());
      }
    }
  }
}
