import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/appbar/index.dart';
import 'package:foodieng/utils/login_util.dart';
import 'package:foodieng/widgets/appbar.dart';

class AppbarPage extends StatefulWidget {
  static const String routeName = '/appbar';

  @override
  _AppbarPageState createState() => _AppbarPageState();
}

class _AppbarPageState extends State<AppbarPage> {
  final userRepository = UserRepository();
//final _appbarBloc = AppbarBloc(userRepository);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      // body: BlocProvider(
      //   create: (context) {
      //     return LoginBloc(
      //       userRepository: userRepository,
      //       authenticationBloc: BlocProvider.of<AuthBlocBloc>(context),
      //     );
      //   },
      //   child: Login(),
      //),
    );
  }
}
//}
