import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/auth/auth_bloc/auth_bloc_bloc.dart';
import 'package:foodieng/blocs/login/login/index.dart';
import 'package:foodieng/utils/ValidationMixin.dart';
import 'package:foodieng/utils/login_util.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with ValidationMixin {
  UserRepository userRepository = UserRepository();
  final AuthBlocBloc authenticationBloc;
  bool isValidPass = false;
  bool isValidEmail = false;
  LoginBloc({this.authenticationBloc});
  @override
  LoginState get initialState => LoginInitial();
  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    print(transition);
    super.onTransition(transition);
  }

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

    if (event is EmailChanged) {
      if (!isFieldEmpty(event.text) && validateEmailAddress(event.text) == true)
        //yield IsFormValid();
        state.copyWith(isEmailValid: true);
      else
        yield UsernameError("Invalid Email Address");
    }
    if (event is ConfirmPasswordChanged) {
      // if (event.text != event.password) {
      //   //&& isFieldEmpty(event.text))
      //   yield ConfirmPasswordError("Password Dont match");
      //   return;
      // }
      // if (isFieldEmpty(event.text)) {
      //   yield ConfirmPasswordError("Password cannot be empty");
      //   return;
      // }
      if (event.text == event.password && !isFieldEmpty(event.text)) {
        state.copyWith(isConfirmPassword: true);
      } else {
        yield ConfirmPasswordError("Password Dont match");
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
    if (event is FirstNameChanged) {
      if (!isFieldEmpty(event.text))
        //yield IsFormValid();
        state.copyWith(isFirstNameValid: true);
      else
        yield FirstNameError("First Name cannot be empty");
    }

    if (event is LastNameChanged) {
      if (!isFieldEmpty(event.text))
        state.copyWith(isLastNameValid: true);
      //yield IsFormValid();
      else
        yield LastNameError("Last Name cannot be empty");
    }
    if (event is RegisterButtonPressed) {
      try {
        yield LoginLoading();
        final response = await userRepository.registerUser(event.user);
        if (response.lastName != null) {
          yield RegisterSuccess();
        } else {
          yield LoginFailure(response.firstName);
        }
      } catch (_) {
        print(_.toString());
        yield LoginInitial();
      }
    }
    if (event is RegisterPasswordChanged) {
      if (!isFieldEmpty(event.text)) {
        state.copyWith(isPasswordValid: true);
        //yield IsFormValid();
      } else {
        yield RegisterPasswordError("Password Field cannot be empty");
      }
    }
  }
}
