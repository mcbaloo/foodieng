import 'package:flutter/material.dart';
import 'package:foodieng/blocs/login/login/index.dart';
import 'package:foodieng/utils/fadein.dart';

class Signin extends StatelessWidget {
  const Signin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: <Widget>[
            //       Icon(Icons.account_circle, size: 40),
            //       Padding(
            //         padding: const EdgeInsets.only(left: 8),
            //         child: Text("Sign in",
            //             style: TextStyle(
            //                 color: Theme.of(context).primaryColor,
            //                 fontSize: 18)),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image(
                      //fit: BoxFit.cover,
                      image: AssetImage("assets/images/login.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "You're not signed in",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontFamily: "Gill Bold", fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Sign in now to upload, save and comment",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: "Gill"),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color(0xff462618),
                    onPressed: () =>
                        Navigator.push(context, FadeRoute(page: LoginPage())),
                    child: Text('Sign in',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
