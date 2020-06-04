import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/appbar/appbar_bloc.dart';
import 'package:foodieng/blocs/appbar/index.dart';
import 'package:foodieng/blocs/login/login/index.dart';
import 'package:foodieng/screens/account.dart';
import 'package:foodieng/utils/fadein.dart';

//Widget designBar(BuildContext context) {
class Appbar extends StatelessWidget {
//   const Appbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AppbarBloc();
      },
      child: BlocListener<AppbarBloc, AppbarState>(
          listener: (context, state) {},
          child:
              BlocBuilder<AppbarBloc, AppbarState>(builder: (context, state) {
            return AppBar(
              backgroundColor: Colors.white,
              centerTitle: false,
              iconTheme:
                  new IconThemeData(color: Theme.of(context).primaryColor),
              title: SizedBox(
                width: MediaQuery.of(context).size.width / 2.8,
                child: Image(
                  image: AssetImage("assets/images/foodieng_logo.png"),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  onPressed: () =>
                      {showSearch(context: context, delegate: null)},
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: (state is IsGuest)
                        ? IconButton(
                            onPressed: () => {
                              Navigator.push(
                                  context, FadeRoute(page: Account()))
                            },
                            icon: Icon(
                              Icons.account_circle,
                              size: 30.0,
                            ),
                          )
                        : null),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: (state is ISLoggedIn)
                        ? IconButton(
                            onPressed: () => {
                              Navigator.push(
                                  context, FadeRoute(page: Account()))
                            },
                            icon: Icon(
                              Icons.access_alarm,
                              size: 30.0,
                            ),
                          )
                        : null),
              ],
              elevation: 2,
            );
          })),
    );
  }
}

//return BlocListener<LoginBloc, LoginState>
// return AppBar(
//   backgroundColor: Colors.white,
//   centerTitle: false,
//   iconTheme: new IconThemeData(color: Theme.of(context).primaryColor),
//   title: SizedBox(
//     width: MediaQuery.of(context).size.width / 2.8,
//     child: Image(
//       image: AssetImage("assets/images/foodieng_logo.png"),
//     ),
//   ),
//   actions: <Widget>[
//     IconButton(
//       icon: Icon(
//         Icons.search,
//         size: 30.0,
//       ),
//       onPressed: () => {showSearch(context: context, delegate: null)},
//     ),
//     Padding(
//         padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
//         child: IconButton(
//           onPressed: () =>
//               {Navigator.push(context, FadeRoute(page: Account()))},
//           icon: Icon(
//             Icons.account_circle,
//             size: 30.0,
//           ),
//         ))
//   ],
//   elevation: 2,
// );
//}
