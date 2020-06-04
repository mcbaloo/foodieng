import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/appbar/index.dart';
import 'package:foodieng/utils/login_util.dart';

class AppbarBloc extends Bloc<AppbarEvent, AppbarState> {
  UserRepository repository = UserRepository();

  //AppbarBloc(this.repository);
  @override
  AppbarState get initialState => IsGuest();

  @override
  Stream<AppbarState> mapEventToState(
    AppbarEvent event,
  ) async* {
    try {
      if (event is AppStarted) {
        final bool hasToken = await repository.hasToken();
        if (hasToken) {
          yield ISLoggedIn();
        } else {
          yield IsGuest();
        }
      }

      if (event is AppLoading) {
        yield ISLoggedIn();
      }
      // yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'AppbarBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
