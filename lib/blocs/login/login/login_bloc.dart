import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/auth/auth_bloc/auth_bloc_bloc.dart';
import 'package:foodieng/blocs/login/login/index.dart';
import 'package:foodieng/utils/ValidationMixin.dart';
import 'package:foodieng/utils/login_util.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with ValidationMixin {
  final UserRepository userRepository;
  final AuthBlocBloc authenticationBloc;
  bool isValidPass = false;
  bool isValidEmail = false;
  LoginBloc({this.userRepository, this.authenticationBloc});
  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LogginButtonPressed) {
      yield LoginLoading();
      try {
        final user = await userRepository.validateUser(event.user);
        if (user.username == null) {
          yield LoginFailure("Invalid Credentials");
          yield LoginInitial();
        } else {
          await userRepository.persitUser(user);
          yield LoginSuccess();
        }
      } catch (error) {
        yield LoginFailure(error.toString());
        yield LoginInitial();
      }
    }

    if (event is UsernameChanged) {
      //sprint(validateEmailAddress(event.text));
      if (!isFieldEmpty(event.text) &&
          validateEmailAddress(event.text) == true) {
        //yield IsUsernameValid();
        isValidEmail = true;
        if (isValidPass == true && isValidEmail == true) {
          yield IsFormValid();
        }
      } else {
        isValidEmail = false;
        yield UsernameError("Invalid Email Address");
      }
    }
    if (event is PasswordChanged) {
      if (!isFieldEmpty(event.text)) {
        isValidPass = true;
        if (isValidPass == true && isValidEmail == true) {
          yield IsFormValid();
        }
      } else {
        isValidPass = false;
        yield PasswordError("Password Field cannot be empty");
      }
    }
  }
}
