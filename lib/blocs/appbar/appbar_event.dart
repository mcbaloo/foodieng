import 'package:equatable/equatable.dart';

abstract class AppbarEvent extends Equatable {
  @override
  List<Object> get props => [];
  const AppbarEvent();
  //Stream<AppbarState> applyAsync({AppbarState currentState, AppbarBloc bloc});
}

// class LoadAppbarEvent extends AppbarEvent {
//   @override
//   Stream<AppbarState> applyAsync(
//{AppbarState currentState, AppbarBloc bloc}) async* {
// try {
//   yield UnAppbarState();
//   await Future.delayed(Duration(seconds: 1));
//   yield InAppbarState('Hello world');
// } catch (_, stackTrace) {
//   developer.log('$_', name: 'LoadAppbarEvent', error: _, stackTrace: stackTrace);
//   yield ErrorAppbarState( _?.toString());
// }

//   }
// }
class AppLoading extends AppbarEvent {
  List<Object> get props => [];
  @override
  String toString() => 'AppLoading';
}
