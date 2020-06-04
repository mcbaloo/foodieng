import 'package:equatable/equatable.dart';

abstract class BottomNavState extends Equatable {
  final List propss;
  BottomNavState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

class BottomNavInitial extends BottomNavState {}

class BottomNavChanged extends BottomNavState {
  final int currentIndex;

  BottomNavChanged({this.currentIndex}) : super([currentIndex]);

  @override
  String toString() => 'BottomNavChanged to $currentIndex';
}

/// UnInitialized
// class UnBottomNavState extends BottomNavState {

//   UnBottomNavState();

//   @override
//   String toString() => 'UnBottomNavState';
// }

// /// Initialized
// class InBottomNavState extends BottomNavState {
//   final String hello;

//   InBottomNavState(this.hello) : super([hello]);

//   @override
//   String toString() => 'InBottomNavState $hello';

// }

// class ErrorBottomNavState extends BottomNavState {
//   final String errorMessage;

//   ErrorBottomNavState(this.errorMessage): super([errorMessage]);

//   @override
//   String toString() => 'ErrorBottomNavState';
// }
