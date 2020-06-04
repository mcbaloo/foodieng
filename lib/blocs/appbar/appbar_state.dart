import 'package:equatable/equatable.dart';

abstract class AppbarState extends Equatable {
  final List propss;
  AppbarState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

class IsGuest extends AppbarState {}

class ISLoggedIn extends AppbarState {}

class AppStarted extends AppbarState {}
