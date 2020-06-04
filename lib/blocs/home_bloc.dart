import 'package:foodieng/blocs/appbar/index.dart';

class AppBloc {
  AppbarBloc _appbarBloc;

  AppBloc() : _appbarBloc = AppbarBloc();

  AppbarBloc get appbarbloc => _appbarBloc;
}
